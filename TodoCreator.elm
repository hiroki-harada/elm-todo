module TodoCreator exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (value, type_)

-- model
-- String型の文字列Itemを定義
type alias Item = 
    String

-- Item型の変数inputStrをレコードとして持つ、Modelを定義
type alias Model = 
    { inputStr : Item
    }

-- ModelのコンストラクタinitialModelを定義
initialModel : Model
initialModel = 
    { inputStr = ""
    }

-- Msg型はNoOpか、String型の変数UpdateInputのどちらかを取るように定義
type Msg
    = NoOp
    | UpdateInput String


-- update
-- update(関数？)を定義、MsgとModelを受け取って、ModelとMsg型のCmdを返す 
update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NoOp ->
            model ! []

        UpdateInput s ->
            { model | inputStr = s } ! []


-- view
-- view(関数？)を定義、
view : Model -> Html Msg
view model = 
    div []
        [ todoInput model
        ]

-- todoInputを定義
todoInput : Model -> Html Msg
todoInput model = 
    form []
        -- フォームに入力があったらUpdateInputが発火
        -- 入力された値(value)は、引数modelのinputStrへ格納
        [ input [ onInput UpdateInput, value model.inputStr ] []
        ]
