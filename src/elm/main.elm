import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (..)

main =
    div
        [ class "wrapper" ]
        [ h1
            [ class "headline" ]
            [ text "Hello World" ]
        , p []
            [ text "HTML, mit Unqualified Imports." ]
        ]