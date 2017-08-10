module Main where

import SLLex
import SLParse

main =	do
  input <- getContents
  let ast = parse (alexScanTokens input)
  putStrLn (show ast)
  putStrLn "Parsen der Eingabe erfolgreich."
