/* Copyright (c) 1997 Andrew W. Appel.  Licensed software: see LICENSE file */
package straightline;

import java_cup.runtime.Symbol;

%% 

%public
%class Lexer
%implements java_cup.runtime.Scanner
%function next_token
%type java_cup.runtime.Symbol
%yylexthrow ParseException

%char
%line
%column

%{

private void error(String s) throws ParseException {
  throw new ParseException("At line " + yyline + ", column " + yycolumn + ": " + s);
}

private Symbol symbol(int kind) {
    return new Symbol(kind, yyline, yycolumn);
}

private Symbol symbol(int kind, Object value) {
    return new Symbol(kind, yyline, yycolumn, value);
}

private int commentDepth = 0;

%}

%eofval{
  {
    if (commentDepth > 0) {
       error("runaway comment");
    }
    return symbol(Parser_sym.EOF);
  }
%eofval}       

%state SingleLineComment MultiLineComment
idchars=[A-Za-z_0-9]
id=[A-Za-z]{idchars}*
ws=[\r\n\t\ ]*
%%
<YYINITIAL> {
   {ws}     { }
/* Datentypen */
   "int"    { return symbol(Parser_sym.INTTYPE); }
   "boolean" { return symbol(Parser_sym.BOOL); }
   "char"   { return symbol(Parser_sym.CHAR); }
   "String" { return symbol(Parser_sym.STRING); }

/* Klammern und Kontrollzeichen */
   "["      { return symbol(Parser_sym.LBRACKET); }
   "]"      { return symbol(Parser_sym.RBRACKET); }
   "{"      { return symbol(Parser_sym.LCURL); }
   "}"      { return symbol(Parser_sym.RCURL); }
   "("      { return symbol(Parser_sym.LPAREN); }
   ")"      { return symbol(Parser_sym.RPAREN); }
   ","      { return symbol(Parser_sym.COMMA); }
   ";"      { return symbol(Parser_sym.SEMICOLON); }
   "."      { return symbol(Parser_sym.DOT); }
/* Statements */
   "if"     { return symbol(Parser_sym.IF); }
   "while"  { return symbol(Parser_sym.WHILE); }
   "System.out.println"   { return symbol(Parser_sym.PRINTLN); }
   "System.out.print"     { return symbol(Parser_sym.PRINT); }
   "length" { return symbol(Parser_sym.LENGTH); }
   "this"   { return symbol(Parser_sym.THIS); }
   "new"    { return symbol(Parser_sym.NEW); }
   "class"  { return symbol(Parser_sym.CLASS); }
   "public" { return symbol(Parser_sym.PUBLIC); }
   "static" { return symbol(Parser_sym.STATIC); }
   "void"   { return symbol(Parser_sym.VOID); }
   "main"   { return symbol(Parser_sym.MAIN); }
   "extends"  { return symbol(Parser_sym.EXTENDS); }


/* Operatoren */
   "&&"     { return symbol(Parser_sym.AND); }
   "<"      { return symbol(Parser_sym.LESS); }
   "+"      { return symbol(Parser_sym.PLUS); }
   "-"      { return symbol(Parser_sym.MINUS); }
   "*"      { return symbol(Parser_sym.TIMES); }
   "/"      { return symbol(Parser_sym.DIVIDE); }
   "="      { return symbol(Parser_sym.ASSIGNMENT); }
   "true"   { return symbol(Parser_sym.TRUE); }
   "false"  { return symbol(Parser_sym.FALSE); }
   "!"      { return symbol(Parser_sym.INV); }
   
   {id}     { return symbol(Parser_sym.IDENTIFIER, yytext()); }
   [0-9]+   { return symbol(Parser_sym.INT, Integer.parseInt(yytext())); }
   "/*"     { commentDepth = 1; yybegin(MultiLineComment); }
   "*/"     { error("unexpected */"); }
   "//"     { yybegin(SingleLineComment); }
   .        { error("illegal token"); }
}
<SingleLineComment> {
   [^\n]+   { /* ignore */ }
   \n       { yybegin(YYINITIAL); }
}
<MultiLineComment> {
    "/*"    { commentDepth++; }
    "*/"    { commentDepth--; if (commentDepth==0) yybegin(YYINITIAL); }
    .|\n    { }
}


