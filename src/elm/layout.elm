module Layout exposing (..)

import Html exposing (div, Html, text, button)
import Html.Attributes exposing (..)

view html =
   div [class "layout"] [
        div [class "header"] [text "BugHouse"],

        div [class "main"] [ html ]
   ]