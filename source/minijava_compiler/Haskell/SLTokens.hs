module SLTokens where

data Token p = 
      TInt p
    | TBool  p
    | LBrace  p
    | RBrace  p
    | LBrack  p
    | RBrack  p
    | LPar  p
    | RPar  p
    | DLIf  p
    | DLThen  p
    | DLElse p
    | Print  p
    | Assign  p
    | OpAnd  p
    | OpEq  p
    | OpLt  p
    | OpPlus  p
    | OpMinus  p
    | OpTimes  p
    | OpDivide  p
    | CTrue  p
    | CFalse  p
    | Comma  p
    | Semicol  p
    | IVal Int p
    | Id String  p
 deriving (Eq,Read,Show)

filterPn :: String -> String
filterPn [] = []
filterPn (' ':'(':'P':'n': s) = filterPn (tail $ dropWhile (/= ')') s)
filterPn (c:cs) = c:filterPn cs

token_pos :: (Show p) => Token p -> p
token_pos (TInt p) = p
token_pos (TBool  p) = p
token_pos (LBrace  p) = p
token_pos (RBrace  p) = p
token_pos (LBrack  p) = p
token_pos (RBrack  p) = p
token_pos (LPar  p) = p
token_pos (RPar  p) = p
token_pos (DLIf  p) = p
token_pos (DLThen  p) = p
token_pos (DLElse p) = p
token_pos (Print  p) = p
token_pos (Assign  p) = p
token_pos (OpAnd  p) = p
token_pos (OpEq  p) = p
token_pos (OpLt  p) = p
token_pos (OpPlus  p) = p
token_pos (OpMinus  p) = p
token_pos (OpTimes  p) = p
token_pos (CTrue  p) = p
token_pos (CFalse  p) = p
token_pos (Comma  p) = p
token_pos (Semicol  p) = p
token_pos (IVal _ p) = p
token_pos (Id _  p) = p

