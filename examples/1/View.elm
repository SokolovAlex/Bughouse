module View exposing (view)

import Html exposing (div, Html, text, button)
import Collage
import Element
import Color exposing (Color)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick, onMouseDown, onMouseUp, on)
import Model exposing (Model)
import Actions exposing (Action)
import Json.Decode as Json


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


onTouchStart : Action -> Html.Attribute Action
onTouchStart action =
    on "touchstart" (Json.succeed action)


onTouchEnd : Action -> Html.Attribute Action
onTouchEnd action =
    on "touchend" (Json.succeed action)


renderBox : ( Float, Float ) -> (Color -> Color) -> Color -> ( Int, Int ) -> Collage.Form
renderBox ( xOff, yOff ) fun c ( x, y ) =
    Collage.rect 30 30
        |> Collage.filled (fun c)
        |> Collage.move ( (toFloat x + xOff) * 30, (toFloat y + yOff) * -30 )


renderTitle : String -> Html Action
renderTitle txt =
    div
        [ style
            [ "color" => "#34495f"
            , "font-size" => "40px"
            , "line-height" => "60px"
            , "margin" => "30px 0 0"
            ]
        ]
        [ text txt ]


renderLabel : String -> Html Action
renderLabel txt =
    div
        [ style
            [ "color" => "#bdc3c7"
            , "font-weight" => "300"
            , "line-height" => "1"
            , "margin" => "30px 0 0"
            ]
        ]
        [ text txt ]


renderCount : Int -> Html Action
renderCount n =
    div
        [ style
            [ "color" => "#3993d0"
            , "font-size" => "30px"
            , "line-height" => "1"
            , "margin" => "5px 0 0"
            ]
        ]
        [ text (toString n) ]


renderControlButton : String -> List (Html.Attribute Action) -> Html Action
renderControlButton txt attrs =
    div
        (style
            [ "background" => "#ecf0f1"
            , "border" => "0"
            , "color" => "#34495f"
            , "cursor" => "pointer"
            , "text-align" => "center"
            , "-webkit-user-select" => "none"
            , "display" => "block"
            , "float" => "left"
            , "font-family" => "Helvetica, Arial, sans-serif"
            , "font-size" => "24px"
            , "font-weight" => "300"
            , "height" => "60px"
            , "line-height" => "60px"
            , "margin" => "20px 20px 0 0"
            , "outline" => "none"
            , "padding" => "0"
            , "width" => "60px"
            ]
            :: attrs
        )
        [ text txt ]


renderControls : Html Action
renderControls =
    div
        [ style
            [ "height" => "80px"
            , "left" => "0"
            , "position" => "absolute"
            , "top" => "600px"
            ]
        ]
        [ renderControlButton "↻"
            [ onMouseDown (Actions.Rotate True)
            , onMouseUp (Actions.Rotate False)
            , onTouchStart (Actions.Rotate True)
            , onTouchEnd (Actions.Rotate False)
            ]
        , renderControlButton "←"
            [ onMouseDown (Actions.MoveLeft True)
            , onMouseUp (Actions.MoveLeft False)
            , onTouchStart (Actions.MoveLeft True)
            , onTouchEnd (Actions.MoveLeft False)
            ]
        , renderControlButton "→"
            [ onMouseDown (Actions.MoveRight True)
            , onMouseUp (Actions.MoveRight False)
            , onTouchStart (Actions.MoveRight True)
            , onTouchEnd (Actions.MoveRight False)
            ]
        , renderControlButton "↓"
            [ onMouseDown (Actions.Accelerate True)
            , onMouseUp (Actions.Accelerate False)
            , onTouchStart (Actions.Accelerate True)
            , onTouchEnd (Actions.Accelerate False)
            ]
        ]


view : Model -> Html Action
view model =
    div
        [ style [ "padding" => "30px 0" ]
        , onTouchEnd Actions.UnlockButtons
        , onMouseUp Actions.UnlockButtons
        ]
        [ div
            [ style
                [ "height" => "680px"
                , "margin" => "auto"
                , "position" => "relative"
                , "width" => "480px"
                ]
            ]
        ]