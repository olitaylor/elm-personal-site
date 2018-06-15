module App exposing (..)

import Html exposing (Html, div, p, a, text, program)

import Html.Attributes exposing (href)

import Navigation exposing (Location)

import UrlParser exposing (Parser, (</>), s, parseHash)





-- ROUTE
type Route
    = Home
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    UrlParser.oneOf
      [ UrlParser.map Home UrlParser.top
    ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute





-- VARS
name : String
name = "Oliver Taylor"

twitterHandle : String
twitterHandle = "https://twitter.com/0liverJTaylor"

jobtitle : String
jobtitle = "Front End Developer"




-- CSS
buildStyle : List (List ( String, String )) -> Html.Attribute msg
buildStyle styleLists =
  Html.Attributes.style <| List.concat styleLists

containerStyle : List (String, String)
containerStyle =
  [ 
    ("font-family", "monospace"),
    ("text-align", "center"),
    ("display", "table"),
    ("position", "absolute"),
    ("height", "100%"),
    ("width", "100%")
  ]

middleStyle : List (String, String)
middleStyle =
  [ 
    ("display", "table-cell"),
    ("vertical-align", "middle")
  ]

innerStyle : List (String, String)
innerStyle =
  [ 
    ("margin", "0 auto"),
    ("width", "400px")
  ]

titleStyle : List (String, String)
titleStyle = 
  [
    ("display", "block"),
    ("font-size", "24px")
  ]

jobStyle : List (String, String)
jobStyle = 
  [
    ("display", "block"),
    ("font-size", "18px")
  ]




-- MAIN
main : Html msg
main =
  div [ buildStyle [ containerStyle ] ]
    [ 
      div [ buildStyle [ middleStyle ] ]
      [
        div[ buildStyle [ innerStyle ]]
        [
            p [ buildStyle [ titleStyle ] ] [ text name ] 
          , p [ buildStyle [ jobStyle ] ] [ text jobtitle ]
        ]
      ]
    ]
