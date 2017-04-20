module Components.BottomBar.View exposing (..)

import Html exposing (Html, div, text, span, img)
import Html.Attributes exposing (src)
import Html.CssHelpers

import Models exposing (Model)
import Msgs exposing (Msg)

import CssClasses

{ class } =
  Html.CssHelpers.withNamespace ""

controlIcon : Html Msg
controlIcon =
  div [ class [ CssClasses.ControlIcon] ]
      []

progressBar : Float -> Html Msg
progressBar progress =
  div [ class [ CssClasses.ProgressBar ] ]
      [ div [ class [ CssClasses.Progress ] ]
          []
      ]

progress : Model -> Html Msg
progress model =
  div [ class [ CssClasses.ProgressGroup ] ]
      [ span [ class [ CssClasses.FontSmall ] ]
          [ text "2:00" ]
      , progressBar 10
      , span [ class [ CssClasses.FontSmall ] ]
          [ text "2:00" ]
      ]

musicInfo : Model -> Html Msg
musicInfo model =
  div [ class [ CssClasses.NowPlaying] ]
    [ img
        [ src "https://upload.wikimedia.org/wikipedia/en/b/b2/Metallica_-_Master_of_Puppets_cover.jpg"
        , class [ CssClasses.AlbumCover ]
        ] []
    , div [ class [ CssClasses.MusicInfo ] ]
        [ span [ class [ CssClasses.MusicTitle ] ]
            [ text "One" ]
        , span [ class [ CssClasses.FontSmall ] ]
            [ text "Metallica" ]
        ]
    ]

soundControl : Model -> Html Msg
soundControl model =
  div [ class [ CssClasses.SoundControl ] ]
    [ div [ class [ CssClasses.ControlButtons ] ]
        [ controlIcon
        , controlIcon
        ]
    , progressBar 10 ]


controls : Model -> Html Msg
controls model =
  div [ class [ CssClasses.Controls ] ]
      [ div [ class [ CssClasses.ControlButtons ] ]
          [ controlIcon
          , controlIcon
          , controlIcon
          ]
      , progress model
      ]

render : Model -> Html Msg
render model =
  div [ class [ CssClasses.BottomBar ] ]
      [ musicInfo model
      , controls model
      , soundControl model
      ]
