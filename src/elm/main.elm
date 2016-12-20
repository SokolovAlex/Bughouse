import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
--import Chessboard exposing (..)

main =
  Html.beginnerProgram {
    model = model,
    view = view,
    update = update
    }

model : Int
model =
  0

update : Int -> Int
update num = num + 2

-- VIEW
view : Int -> Html msg
view model =
  div []
