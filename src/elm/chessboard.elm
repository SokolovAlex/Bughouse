module Chessboard exposing (..)

import Html exposing (div, Html, text, button)
import Element
import Color exposing (..)
import Collage exposing (..)
import Element exposing (..)

makeSquare color size =
  filled color (square size)

chessboard : Element
chessboard =
    collage 300 300
        [makeSquare blue 50]
