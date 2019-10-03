module Main where

import Prelude

import Effect (Effect)
import App.Sample as AS

-- If you `spago bundle-module --to spago-out.js`
-- you get a single js file for your whole Purescript code
-- which may (or may not) be more space efficient

-- This would be a heck of a lot nicer if one could re-export
-- from Main and have the re-exports show up in js

hello :: String -> String
hello = AS.hello

toastMe :: Effect Unit
toastMe = AS.toastMe

toastSpreadsheetName :: Effect Unit
toastSpreadsheetName = AS.toastSpreadsheetName
