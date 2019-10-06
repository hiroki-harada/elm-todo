module TodoList exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


-- model
-- ToDo型を定義、完了フラグとtodoの内容を設定
type alias ToDo = 
    { done : Bool
    , item : String
    }

-- ToDo型のリストを持つtodoListを保持するModelを定義
type alias Model = 
    { todoList : List ToDo
    }

-- Model型のコンストラクタinitialModelを定義してtodoListにリストを代入
initialModel : Model
initialModel = 
    { todoList = 
        [ ToDo False "item1" 
        , ToDo False "item2"
        , ToDo False "item3"
        ]
    }

-- MsgにはNoOpかAddNewのどちらかの処理を行う？
type Msg
    = NoOp
    | AddNew


-- update
-- update関数を定義
update : Msg -> ToDo -> Model -> ( Model, Cmd Msg )

update message todo model =
    -- messageの内容によって、処理を分岐させている
    case message of
        NoOp ->
            model ! []

        AddNew -> 
            { model | todoList = model.todoList ++ [todo] } ! []


-- view
view : Model -> Html Msg
view model = 
    div []
        [
        div [ class "p2" ]
            [ addButton
           , viewItems model.todoList
            ]
        ]


viewItems : List ToDo -> Html Msg
viewItems models = 
    ul [] (List.map viewItem models)

viewItem : ToDo -> Html Msg
viewItem model = 
    li [] [
        text model.item
    ]

-- update ボタンを定義、クリックでAddNew関数が発火する
addButton : Html Msg
addButton = 
    div [] 
        [ button [ onClick AddNew ] [ text "Add" ] ]