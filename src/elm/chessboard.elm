module Chessboard exposing (..)

import Html exposing (div, Html, text, button)
import Html.Attributes exposing (..)
import Color exposing (..)
import Collage exposing (..)
import Element exposing (..)

makeSquare color size =
  filled color (square size)

cell : Element
cell =
    collage 300 300
        [makeSquare blue 50]


chessboard =
  div [class "test"] 
    [ 
      div [] [Html.text "!!!!!!!!!!!!!!!!!!!!!!"]
    ]