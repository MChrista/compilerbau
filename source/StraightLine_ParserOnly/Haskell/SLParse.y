{
module SLParse   where

-- import Alex

import SLLex
import SLTokens
}

%name parse
%tokentype { (Token AlexPosn) }

%name parse

%token
  	'('		{ LPar _ }
  	')'		{ RPar _ }
   	print 		{ Print _ } 
   	'=' 		{ Assign _ } 
  	'+' 		{ SLTokens.OpPlus _ }
  	'-'		{ SLTokens.OpMinus _ } 
  	'*' 		{ SLTokens.OpTimes _ }
  	'/'		{ SLTokens.OpDivide _ } 
  	',' 		{ Comma _ }
  	';' 		{ Semicol _ }
        integer         { IVal $$ _ }
        identifier      { Id $$ _ }

%right ';'
%left '+' '-'
%left '*' '/'

%%

Stm :: { () }
Stm:  Stm ';' Stm                   { }
|  identifier '=' Exp               { }
|  print '(' ExpList ')'            { }

Exp :: { () }
Exp: identifier     {  }
| integer           { }
| Exp '+' Exp     { }
| Exp '-' Exp     {  }
| Exp '*' Exp     {  }
| Exp '/' Exp     {  }
| '(' Stm ',' Exp ')' {  }

ExpList :: { () }
ExpList: Exp            { }
| Exp ',' ExpList       { }


{
happyError :: [Token AlexPosn] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
	where
	lcn = 	case tks of
		  [] -> "end of file"
		  (tk:_) -> "line " ++ show l ++ ", column " ++ show c ++ " (token " ++ filterPn (show tk) ++ ")"
			where AlexPn _ l c = token_pos tk

}
