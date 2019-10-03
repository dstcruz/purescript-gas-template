module App.Sample where

import Prelude
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)


hello :: String -> String
hello n = "Hello " <> n


foreign import data Spreadsheet :: Type
foreign import getActiveSpreadsheet :: Effect Spreadsheet
foreign import _getSpreadsheetName :: EffectFn1 Spreadsheet String
foreign import _toast :: EffectFn2 Spreadsheet String Unit


getSpreadsheetName :: Spreadsheet -> Effect String
getSpreadsheetName = runEffectFn1 _getSpreadsheetName


toast :: Spreadsheet -> String -> Effect Unit
toast = runEffectFn2 _toast


toastMe :: Effect Unit
toastMe = do
  sheet <- getActiveSpreadsheet
  toast sheet "Toast me!"


toastSpreadsheetName :: Effect Unit
toastSpreadsheetName = do
  sheet <- getActiveSpreadsheet
  name <- getSpreadsheetName sheet
  toast sheet name
