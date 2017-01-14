module Layout exposing (..)

import Html exposing (div, Html, text, button, input, a, ul, li, span, form)
import Html.Attributes exposing (..)

view : Html msg -> Html msg
view html =
   div [class "layout"] [
        div [class "navbar navbar-toggleable-md navbar-inverse bg-inverse fixed-top"] [
            button [ class "navbar-toggler navbar-toggler-right", type_ "button", 
                attribute "data-toggle" "collapse",  attribute "data-target" "#navbarsExampleDefault",  attribute "aria-controls" "navbarsExampleDefault",
                attribute "aria-expanded" "false",  attribute "aria-label" "Toggle navigation"] [
                    span [class "navbar-toggler-icon"] []
                ],
            a [class "navbar-brand", href "#"] [text "BugHouse"],
            div [class "collapse navbar-collapse", id "navbarsExampleDefault"] [
                ul [class "navbar-nav mr-auto"] [
                    li [class "nav-item active"] [
                        a [class "navbar-brand", href "#"] [
                            text "Home", 
                            span [class "sr-only"] [ text "(current)"]
                        ]
                    ],
                    li [class "nav-item"] [
                        a [class "nav-link", href "#"] [
                            text "Link"
                        ]
                    ],
                    li [class "nav-item"] [
                        a [class "nav-link disabled", href "#"] [
                            text "Disabled"
                        ]
                    ],
                    li [class "nav-item dropdown"] [
                        a [class "nav-link dropdown-toggle", id "dropdown01",
                            attribute "data-toggle" "dropdown", attribute "aria-haspopup" "true", attribute "aria-expanded" "false"] [
                            text "Dropdown"
                        ],
                        div [class "dropdown-menu", attribute "aria-labelledby" "dropdown01"] [
                            a [class "dropdown-item", href "#"] [text "Action"],
                            a [class "dropdown-item", href "#"] [text "Another action"],
                            a [class "dropdown-item", href "#"] [text "Something else here"]
                        ]
                    ]
                ],
                Html.form [class "form-inline my-2 my-lg-0"] [
                    input [class "form-control mr-sm-2", type_ "text", attribute "placeholder" "Search"] [],
                    button [class"btn btn-outline-success my-2 my-sm-0", type_ "submit"] [text "Search"]
                ]
            ]
        ],
        div [class "container"] [ html ]
   ]