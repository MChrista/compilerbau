{
module SLLex where

import SLTokens
}

%wrapper "posn"

$digit = 0-9        -- digits
$alpha = [a-zA-Z]   -- alphabetic characters
$letter = $alpha 

tokens :-

  $white+;
  "//".*;
  "int"    { \ p s  -> TInt p }
  "boolean"{ \ p s  -> TBool p }
  "{"	   { \ p s  -> LBrace p }
  "}"	   { \ p s  -> RBrace p }
  "["	   { \ p s  -> LBrack p }
  "]"	   { \ p s  -> RBrack p }
  "("	   { \ p s  -> LPar p }
  ")"	   { \ p s  -> RPar p }
  "if"     { \ p s  -> DLIf p }
  "print"  { \ p s  -> Print p }
  "="      { \ p s  -> Assign p } 
  "&&"     { \ p s  -> OpAnd p } 
  "=="     { \ p s  -> OpEq p } 
  "<"      { \ p s  -> OpLt p } 
  "+"      { \ p s  -> OpPlus p }
  "-"      { \ p s  -> OpMinus p } 
  "*"      { \ p s  -> OpTimes p }
  "/"      { \ p s  -> OpDivide p }
  "true"   { \ p s  -> CTrue p }
  "false"  { \ p s  -> CFalse p }
  ","	   { \ p s  -> Comma p }
  ";"	   { \ p s  -> Semicol p }
  $digit+  { \ p s  -> IVal (read s) p }
  $letter [$letter $digit \_ \']*{ \ p s  -> Id s p }

{
-- Each action has type :: String -> Token

-- The token type is in DLTokens.hs
{-
main = do
  s <- getContents
  print (alexScanTokens s)
-}
}