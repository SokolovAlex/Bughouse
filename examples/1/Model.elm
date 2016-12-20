module Model exposing (Model, initial)

import Random
import Color exposing (Color)
import Time exposing (Time)


type alias Model =
    { position : ( Int, Float )
    , lines : Int
    , score : Int
    , seed : Random.Seed
    , acceleration : Bool
    , width : Int
    , height : Int
    }


initial : Model
initial =
    { position = ( 0, 0 )
    , lines = 0
    , score = 0
    , seed = Random.initialSeed 0
    , acceleration = False
    , width = 10
    , height = 20
    }