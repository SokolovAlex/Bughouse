import Html exposing (Html, button, div, text, h2)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Chessboard

main =
  Html.beginnerProgram {
    model = model,
    view = view,
    update = update
    }

model : Int

model =
  0

type Msg = StartGame String

update msg model = 
  case msg of 
    StartGame text -> model

-- VIEW
view : Int -> Html msg
view model =
  div [class "test"] 
    [ 
      h2 [] [text "Bughouse"] 
      , Chessboard.chessboard
    ]
