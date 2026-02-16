module Helper exposing (..)

import Html


add2 : Int -> Int -> Int
add2 int1 int2 =
    int1 + int2


add3 : Float -> Float -> Float -> Float
add3 int1 int2 int3 =
    int1 + int2 + int3


calc : Int -> Int -> (Int -> Int -> Int) -> Int
calc int1 int2 operator =
    operator int1 int2


languageNames : List { name : String, releaseYear : Int, currentVersion : String } -> List String
languageNames inData =
    List.map .name inData


onlyStudents : List { name : String, uType : String } -> List String
onlyStudents fuzzList =
    List.map
        (\u ->
            case .uType u of
                "Student" ->
                    .name u

                "Professor" ->
                    ""

                _ ->
                    ""
        )
        fuzzList


type alias Videogame =
    { title : String, releaseYear : Int, available : Bool, downloads : Int, genres : List String }


videogames : List Videogame
videogames =
    [ { title = "Control"
      , releaseYear = 2019
      , available = True
      , downloads = 5000000
      , genres = [ "Action", "Shooter" ]
      }
    , { title = "Ocarina of Time"
      , releaseYear = 1998
      , available = True
      , downloads = 7000000
      , genres = [ "Action", "Adventure" ]
      }
    ]


getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres games =
    List.map .genres games


type alias Computer =
    { ram : String, model : String, brand : String, screenSize : String }


myLaptop : Computer
myLaptop =
    { ram = "32"
    , model = "Thinkpad"
    , brand = "Lenovo"
    , screenSize = "13"
    }


main : Html.Html msg
main =
    Html.div []
        [ Html.h1 []
            [ Html.text "My laptop"
            ]
        , Html.div []
            [ Html.ul []
                [ Html.li [] [ Html.text ("Ram: " ++ .ram myLaptop) ]
                , Html.li [] [ Html.text ("Modelo: " ++ .model myLaptop) ]
                , Html.li [] [ Html.text ("Marca: " ++ .brand myLaptop) ]
                , Html.li [] [ Html.text ("Pulgadas: " ++ .screenSize myLaptop) ]
                ]
            ]
        ]
