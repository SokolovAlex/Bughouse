module Update exposing (update)

import Model exposing (..)
import Actions exposing (..)
import Time exposing (Time)
import Random
import Task exposing (Task)


update : Action -> Model -> ( Model, Cmd Action )
update action model =
    case action of
        Init ->
            let
                ( next, seed ) = 1
            in
                ( { model | seed = seed, next = next })

        MoveLeft on ->
            ( startMove { model | moveLeft = on }
            , Cmd.none
            )

        MoveRight on ->
            ( startMove { model | moveRight = on }
            , Cmd.none
            )

        Rotate False ->
            ( { model | rotation = Nothing }
            , Cmd.none
            )

        Rotate True ->
            ( { model | rotation = Just { active = True, elapsed = 0 } }
            , Cmd.none
            )

        Accelerate on ->
            ( { model | acceleration = on }
            , Cmd.none
            )

        UnlockButtons ->
            ( { model | rotation = Nothing, direction = Nothing, acceleration = False }
            , Cmd.none
            )

        Tick time ->
            model
                |> animate (min time 25)

        Noop ->
            ( model, Cmd.none )


animate : Time -> Model -> Model
animate elapsed model =
    model

direction : Model -> Int
direction { moveLeft, moveRight } =
    case ( moveLeft, moveRight ) of
        ( True, False ) ->
            -1

        ( False, True ) ->
            1

        _ ->
            0


startMove : Model -> Model
startMove model =
    if direction model /= 0 then
        { model | direction = Just { active = True, elapsed = 0 } }
    else
        { model | direction = Nothing }


activateButton : Time -> Time -> { a | active : Bool, elapsed : Time } -> { a | active : Bool, elapsed : Time }
activateButton interval elapsed state =
    let
        elapsed_ =
            state.elapsed + elapsed
    in
        if elapsed_ > interval then
            { state | active = True, elapsed = elapsed_ - interval }
        else
            { state | active = False, elapsed = elapsed_ }