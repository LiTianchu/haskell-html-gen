module Main (main) where

main :: IO ()
main = putStrLn (makeHtml "My Page Title"  (h1_ "My H1" <> p_ "My Page Content"))


html_ :: String -> String
html_ = el "html" 

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

-- Functions that take 2 arguments are actually 1 argument: String -> (String -> String)
makeHtml :: String -> String -> String
makeHtml pageTitleContent pageBodyContent = html_ ((head_ (title_ pageTitleContent)) <> body_ pageBodyContent)

el :: String -> String -> String
-- Syntax sugar for creating functions
el = \tag -> \content  -> "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
