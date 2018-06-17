module App exposing (..)

import Html exposing (Html, div, p, a, text, program)

import Html.Attributes exposing (href)




-- VARS
details = 
  {
    name = "Oliver Taylor"
  , jobtitle = "Front End Developer"
  , twitterHandle = "https://twitter.com/0liverJTaylor"
  , githubHandle = "https://github.com/olitaylor"
  }




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
    ("vertical-align", "middle"),
    ("position", "relative"),
    ("background", "#141e30"),
    ("background", "-webkit-linear-gradient(to right, #141e30, #243b55"),
    ("background", "linear-gradient(to right, #141e30, #243b55)")
  ]

innerStyle : List (String, String)
innerStyle =
  [ 
    ("margin", "0 auto"),
    ("width", "400px"),
    ("color", "#ffffff")
  ]

titleStyle : List (String, String)
titleStyle = 
  [
    ("display", "block"),
    ("font-size", "30px")
  ]

jobStyle : List (String, String)
jobStyle = 
  [
    ("display", "block"),
    ("font-size", "18px")
  ]

linkStyle : List (String, String)
linkStyle = 
  [
    ("margin", "5px"),
    ("line-height", "24px"),
    ("color", "#ffffff")
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
            p [ buildStyle [ titleStyle ] ] [ text details.name ] 
          , p [ buildStyle [ jobStyle ] ] [ text details.jobtitle ]
          , a [ href details.twitterHandle, buildStyle [ linkStyle ] ] [ text "Twitter" ]
          , a [ href details.githubHandle, buildStyle [ linkStyle ] ] [ text "Github" ]
        ]
      ]
    ]
