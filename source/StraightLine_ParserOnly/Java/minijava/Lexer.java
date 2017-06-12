/* The following code was generated by JFlex 1.4.1 on 12.06.17 12:45 */

/* Copyright (c) 1997 Andrew W. Appel.  Licensed software: see LICENSE file */
package minijava;

import java_cup.runtime.Symbol;


/**
 * This class is a scanner generated by 
 * <a href="http://www.jflex.de/">JFlex</a> 1.4.1
 * on 12.06.17 12:45 from the specification file
 * <tt>Lexer.jflex</tt>
 */
public class Lexer implements java_cup.runtime.Scanner {

  /** This character denotes the end of file */
  public static final int YYEOF = -1;

  /** initial size of the lookahead buffer */
  private static final int ZZ_BUFFERSIZE = 16384;

  /** lexical states */
  public static final int MultiLineComment = 2;
  public static final int YYINITIAL = 0;
  public static final int SingleLineComment = 1;

  /** 
   * Translates characters to character classes
   */
  private static final char [] ZZ_CMAP = {
     0,  0,  0,  0,  0,  0,  0,  0,  0,  3, 45,  0,  0,  3,  0,  0, 
     0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
     3, 43,  0,  0,  0,  0, 36,  0, 21, 22, 40, 38, 23, 39, 25, 41, 
    44, 44, 44, 44, 44, 44, 44, 44, 44, 44,  0, 24, 37, 42,  0,  0, 
     0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2, 
     2,  2,  2, 15,  2,  2,  2,  2,  2,  2,  2, 17,  0, 18,  0,  1, 
     0, 11,  7, 12, 34, 10, 26, 16, 13,  4,  2,  2,  9, 30,  5,  8, 
    32,  2, 14, 27,  6, 31, 33, 28, 35, 29,  2, 19,  0, 20,  0,  0
  };

  /** 
   * Translates DFA states to action switch labels.
   */
  private static final int [] ZZ_ACTION = zzUnpackAction();

  private static final String ZZ_ACTION_PACKED_0 =
    "\1\1\2\0\1\2\1\3\1\1\11\3\1\4\1\5"+
    "\1\6\1\7\1\10\1\11\1\12\1\13\1\14\6\3"+
    "\1\2\1\15\1\16\1\17\1\20\1\21\1\22\1\23"+
    "\1\24\1\25\1\26\3\1\1\3\1\27\22\3\1\30"+
    "\1\31\1\32\1\33\1\34\1\35\1\36\1\37\21\3"+
    "\1\40\1\41\2\3\1\42\2\3\1\43\6\3\1\44"+
    "\1\3\1\45\3\3\1\46\3\3\1\47\1\3\1\50"+
    "\2\3\1\51\1\3\1\52\1\53\1\3\1\54\1\55"+
    "\1\56\1\57\11\0\1\60\1\0\1\61";

  private static int [] zzUnpackAction() {
    int [] result = new int[139];
    int offset = 0;
    offset = zzUnpackAction(ZZ_ACTION_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAction(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /** 
   * Translates a state to a row index in the transition table
   */
  private static final int [] ZZ_ROWMAP = zzUnpackRowMap();

  private static final String ZZ_ROWMAP_PACKED_0 =
    "\0\0\0\56\0\134\0\212\0\270\0\346\0\u0114\0\u0142"+
    "\0\u0170\0\u019e\0\u01cc\0\u01fa\0\u0228\0\u0256\0\u0284\0\212"+
    "\0\212\0\212\0\212\0\212\0\212\0\212\0\212\0\212"+
    "\0\u02b2\0\u02e0\0\u030e\0\u033c\0\u036a\0\u0398\0\u03c6\0\212"+
    "\0\212\0\212\0\u03f4\0\u0422\0\212\0\212\0\u0450\0\u047e"+
    "\0\212\0\212\0\u04ac\0\u04da\0\u0508\0\270\0\u0536\0\u0564"+
    "\0\u0592\0\u05c0\0\u05ee\0\u061c\0\u064a\0\u0678\0\u06a6\0\u06d4"+
    "\0\u0702\0\u0730\0\u075e\0\u078c\0\u07ba\0\u07e8\0\u0816\0\u0844"+
    "\0\212\0\212\0\212\0\212\0\212\0\212\0\270\0\270"+
    "\0\u0872\0\u08a0\0\u08ce\0\u08fc\0\u092a\0\u0958\0\u0986\0\u09b4"+
    "\0\u09e2\0\u0a10\0\u0a3e\0\u0a6c\0\u0a9a\0\u0ac8\0\u0af6\0\u0b24"+
    "\0\u0b52\0\270\0\270\0\u0b80\0\u0bae\0\270\0\u0bdc\0\u0c0a"+
    "\0\270\0\u0c38\0\u0c66\0\u0c94\0\u0cc2\0\u0cf0\0\u0d1e\0\270"+
    "\0\u0d4c\0\270\0\u0d7a\0\u0da8\0\u0dd6\0\270\0\u0e04\0\u0e32"+
    "\0\u0e60\0\270\0\u0e8e\0\270\0\u0ebc\0\u0eea\0\270\0\u0f18"+
    "\0\270\0\270\0\u0f46\0\270\0\270\0\270\0\270\0\u0f74"+
    "\0\u0fa2\0\u0fd0\0\u0ffe\0\u102c\0\u105a\0\u1088\0\u10b6\0\u10e4"+
    "\0\u1112\0\u1140\0\212";

  private static int [] zzUnpackRowMap() {
    int [] result = new int[139];
    int offset = 0;
    offset = zzUnpackRowMap(ZZ_ROWMAP_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackRowMap(String packed, int offset, int [] result) {
    int i = 0;  /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int high = packed.charAt(i++) << 16;
      result[j++] = high | packed.charAt(i++);
    }
    return j;
  }

  /** 
   * The transition table of the DFA
   */
  private static final int [] ZZ_TRANS = zzUnpackTrans();

  private static final String ZZ_TRANS_PACKED_0 =
    "\2\4\1\5\1\6\1\7\1\10\1\11\1\12\1\5"+
    "\1\13\1\14\1\5\1\15\1\5\1\16\1\17\1\5"+
    "\1\20\1\21\1\22\1\23\1\24\1\25\1\26\1\27"+
    "\1\30\1\31\1\32\1\33\1\5\1\34\1\5\1\35"+
    "\1\36\2\5\1\37\1\40\1\41\1\42\1\43\1\44"+
    "\1\45\1\46\1\47\1\6\55\50\1\51\50\52\1\53"+
    "\1\54\4\52\57\0\2\5\1\0\15\5\11\0\12\5"+
    "\10\0\1\5\4\0\1\6\51\0\1\6\1\0\2\5"+
    "\1\0\1\5\1\55\13\5\11\0\1\56\11\5\10\0"+
    "\1\5\2\0\2\5\1\0\6\5\1\57\6\5\11\0"+
    "\12\5\10\0\1\5\2\0\2\5\1\0\11\5\1\60"+
    "\1\61\2\5\11\0\12\5\10\0\1\5\2\0\2\5"+
    "\1\0\4\5\1\62\10\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\6\5\1\63\6\5\11\0\12\5"+
    "\10\0\1\5\2\0\2\5\1\0\5\5\1\64\7\5"+
    "\11\0\11\5\1\65\10\0\1\5\2\0\2\5\1\0"+
    "\5\5\1\66\3\5\1\67\3\5\11\0\12\5\10\0"+
    "\1\5\2\0\2\5\1\0\6\5\1\70\6\5\11\0"+
    "\12\5\10\0\1\5\2\0\2\5\1\0\2\5\1\71"+
    "\12\5\11\0\3\5\1\72\6\5\10\0\1\5\2\0"+
    "\2\5\1\0\7\5\1\73\5\5\11\0\12\5\10\0"+
    "\1\5\2\0\2\5\1\0\2\5\1\74\12\5\11\0"+
    "\12\5\10\0\1\5\2\0\2\5\1\0\11\5\1\75"+
    "\3\5\11\0\12\5\10\0\1\5\2\0\2\5\1\0"+
    "\7\5\1\76\5\5\11\0\12\5\10\0\1\5\2\0"+
    "\2\5\1\0\15\5\11\0\5\5\1\77\4\5\10\0"+
    "\1\5\2\0\2\5\1\0\4\5\1\100\10\5\11\0"+
    "\12\5\10\0\1\5\45\0\1\101\62\0\1\102\54\0"+
    "\1\103\1\104\60\0\1\47\1\0\55\50\52\0\1\105"+
    "\54\0\1\106\6\0\2\5\1\0\2\5\1\107\12\5"+
    "\11\0\12\5\10\0\1\5\2\0\2\5\1\0\15\5"+
    "\11\0\2\5\1\110\7\5\10\0\1\5\2\0\2\5"+
    "\1\0\1\111\14\5\11\0\12\5\10\0\1\5\2\0"+
    "\2\5\1\0\15\5\11\0\5\5\1\112\4\5\10\0"+
    "\1\5\2\0\2\5\1\0\4\5\1\113\10\5\11\0"+
    "\12\5\10\0\1\5\2\0\2\5\1\0\1\5\1\114"+
    "\13\5\11\0\12\5\10\0\1\5\2\0\2\5\1\0"+
    "\15\5\11\0\1\5\1\115\10\5\10\0\1\5\2\0"+
    "\2\5\1\0\2\5\1\116\12\5\11\0\12\5\10\0"+
    "\1\5\2\0\2\5\1\0\7\5\1\117\5\5\11\0"+
    "\12\5\10\0\1\5\2\0\2\5\1\0\7\5\1\120"+
    "\5\5\11\0\12\5\10\0\1\5\2\0\2\5\1\0"+
    "\2\5\1\121\12\5\11\0\12\5\10\0\1\5\2\0"+
    "\2\5\1\0\12\5\1\122\2\5\11\0\12\5\10\0"+
    "\1\5\2\0\2\5\1\0\15\5\11\0\1\5\1\123"+
    "\10\5\10\0\1\5\2\0\2\5\1\0\5\5\1\124"+
    "\7\5\11\0\12\5\10\0\1\5\2\0\2\5\1\0"+
    "\7\5\1\125\5\5\11\0\12\5\10\0\1\5\2\0"+
    "\2\5\1\0\1\126\14\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\1\127\14\5\11\0\12\5\10\0"+
    "\1\5\2\0\2\5\1\0\3\5\1\130\11\5\11\0"+
    "\12\5\10\0\1\5\2\0\2\5\1\0\1\131\14\5"+
    "\11\0\12\5\10\0\1\5\2\0\2\5\1\0\15\5"+
    "\11\0\1\5\1\132\10\5\10\0\1\5\2\0\2\5"+
    "\1\0\6\5\1\133\6\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\5\5\1\134\7\5\11\0\12\5"+
    "\10\0\1\5\2\0\2\5\1\0\14\5\1\135\11\0"+
    "\12\5\10\0\1\5\2\0\2\5\1\0\6\5\1\136"+
    "\6\5\11\0\12\5\10\0\1\5\2\0\2\5\1\0"+
    "\6\5\1\137\6\5\11\0\12\5\10\0\1\5\2\0"+
    "\2\5\1\0\15\5\11\0\1\5\1\140\10\5\10\0"+
    "\1\5\2\0\2\5\1\0\12\5\1\141\2\5\11\0"+
    "\12\5\10\0\1\5\2\0\2\5\1\0\15\5\11\0"+
    "\5\5\1\142\4\5\10\0\1\5\2\0\2\5\1\0"+
    "\1\143\14\5\11\0\12\5\10\0\1\5\2\0\2\5"+
    "\1\0\2\5\1\144\12\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\15\5\11\0\1\5\1\145\10\5"+
    "\10\0\1\5\2\0\2\5\1\0\2\5\1\146\12\5"+
    "\11\0\12\5\10\0\1\5\2\0\2\5\1\0\5\5"+
    "\1\147\7\5\11\0\12\5\10\0\1\5\2\0\2\5"+
    "\1\0\1\5\1\150\13\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\5\5\1\151\7\5\11\0\12\5"+
    "\10\0\1\5\2\0\2\5\1\0\15\5\11\0\10\5"+
    "\1\152\1\5\10\0\1\5\2\0\2\5\1\0\6\5"+
    "\1\153\6\5\11\0\12\5\10\0\1\5\2\0\2\5"+
    "\1\0\2\5\1\154\12\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\1\5\1\155\13\5\11\0\12\5"+
    "\10\0\1\5\2\0\2\5\1\0\15\5\11\0\1\5"+
    "\1\156\10\5\10\0\1\5\2\0\2\5\1\0\12\5"+
    "\1\157\2\5\11\0\12\5\10\0\1\5\2\0\2\5"+
    "\1\0\1\5\1\160\13\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\6\5\1\161\6\5\11\0\12\5"+
    "\10\0\1\5\2\0\2\5\1\0\6\5\1\162\6\5"+
    "\11\0\12\5\10\0\1\5\2\0\2\5\1\0\1\163"+
    "\14\5\11\0\12\5\10\0\1\5\2\0\2\5\1\0"+
    "\6\5\1\164\6\5\11\0\12\5\10\0\1\5\2\0"+
    "\2\5\1\0\1\165\14\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\7\5\1\166\5\5\11\0\12\5"+
    "\10\0\1\5\2\0\2\5\1\0\11\5\1\167\3\5"+
    "\11\0\12\5\10\0\1\5\2\0\2\5\1\0\15\5"+
    "\11\0\10\5\1\170\1\5\10\0\1\5\2\0\2\5"+
    "\1\0\1\5\1\171\13\5\11\0\12\5\10\0\1\5"+
    "\2\0\2\5\1\0\14\5\1\172\11\0\12\5\10\0"+
    "\1\5\2\0\2\5\1\0\15\5\11\0\4\5\1\173"+
    "\5\5\10\0\1\5\2\0\2\5\1\0\10\5\1\174"+
    "\4\5\11\0\12\5\10\0\1\5\2\0\2\5\1\0"+
    "\10\5\1\175\4\5\11\0\12\5\10\0\1\5\2\0"+
    "\2\5\1\0\1\5\1\176\13\5\11\0\12\5\10\0"+
    "\1\5\2\0\2\5\1\0\15\5\11\0\1\5\1\177"+
    "\10\5\10\0\1\5\2\0\2\5\1\0\15\5\10\0"+
    "\1\200\12\5\10\0\1\5\11\0\1\201\104\0\1\202"+
    "\24\0\1\203\100\0\1\204\64\0\1\205\33\0\1\206"+
    "\43\0\1\207\56\0\1\210\56\0\1\211\60\0\1\212"+
    "\51\0\1\213\50\0";

  private static int [] zzUnpackTrans() {
    int [] result = new int[4462];
    int offset = 0;
    offset = zzUnpackTrans(ZZ_TRANS_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackTrans(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      value--;
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /* error codes */
  private static final int ZZ_UNKNOWN_ERROR = 0;
  private static final int ZZ_NO_MATCH = 1;
  private static final int ZZ_PUSHBACK_2BIG = 2;

  /* error messages for the codes above */
  private static final String ZZ_ERROR_MSG[] = {
    "Unkown internal scanner error",
    "Error: could not match input",
    "Error: pushback value was too large"
  };

  /**
   * ZZ_ATTRIBUTE[aState] contains the attributes of state <code>aState</code>
   */
  private static final int [] ZZ_ATTRIBUTE = zzUnpackAttribute();

  private static final String ZZ_ATTRIBUTE_PACKED_0 =
    "\1\1\2\0\1\11\13\1\11\11\7\1\3\11\2\1"+
    "\2\11\2\1\2\11\26\1\6\11\71\1\11\0\1\1"+
    "\1\0\1\11";

  private static int [] zzUnpackAttribute() {
    int [] result = new int[139];
    int offset = 0;
    offset = zzUnpackAttribute(ZZ_ATTRIBUTE_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAttribute(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }

  /** the input device */
  private java.io.Reader zzReader;

  /** the current state of the DFA */
  private int zzState;

  /** the current lexical state */
  private int zzLexicalState = YYINITIAL;

  /** this buffer contains the current text to be matched and is
      the source of the yytext() string */
  private char zzBuffer[] = new char[ZZ_BUFFERSIZE];

  /** the textposition at the last accepting state */
  private int zzMarkedPos;

  /** the textposition at the last state to be included in yytext */
  private int zzPushbackPos;

  /** the current text position in the buffer */
  private int zzCurrentPos;

  /** startRead marks the beginning of the yytext() string in the buffer */
  private int zzStartRead;

  /** endRead marks the last character in the buffer, that has been read
      from input */
  private int zzEndRead;

  /** number of newlines encountered up to the start of the matched text */
  private int yyline;

  /** the number of characters up to the start of the matched text */
  private int yychar;

  /**
   * the number of characters from the last newline up to the start of the 
   * matched text
   */
  private int yycolumn;

  /** 
   * zzAtBOL == true <=> the scanner is currently at the beginning of a line
   */
  private boolean zzAtBOL = true;

  /** zzAtEOF == true <=> the scanner is at the EOF */
  private boolean zzAtEOF;

  /* user code: */

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



  /**
   * Creates a new scanner
   * There is also a java.io.InputStream version of this constructor.
   *
   * @param   in  the java.io.Reader to read input from.
   */
  public Lexer(java.io.Reader in) {
    this.zzReader = in;
  }

  /**
   * Creates a new scanner.
   * There is also java.io.Reader version of this constructor.
   *
   * @param   in  the java.io.Inputstream to read input from.
   */
  public Lexer(java.io.InputStream in) {
    this(new java.io.InputStreamReader(in));
  }


  /**
   * Refills the input buffer.
   *
   * @return      <code>false</code>, iff there was new input.
   * 
   * @exception   java.io.IOException  if any I/O-Error occurs
   */
  private boolean zzRefill() throws java.io.IOException {

    /* first: make room (if you can) */
    if (zzStartRead > 0) {
      System.arraycopy(zzBuffer, zzStartRead,
                       zzBuffer, 0,
                       zzEndRead-zzStartRead);

      /* translate stored positions */
      zzEndRead-= zzStartRead;
      zzCurrentPos-= zzStartRead;
      zzMarkedPos-= zzStartRead;
      zzPushbackPos-= zzStartRead;
      zzStartRead = 0;
    }

    /* is the buffer big enough? */
    if (zzCurrentPos >= zzBuffer.length) {
      /* if not: blow it up */
      char newBuffer[] = new char[zzCurrentPos*2];
      System.arraycopy(zzBuffer, 0, newBuffer, 0, zzBuffer.length);
      zzBuffer = newBuffer;
    }

    /* finally: fill the buffer with new input */
    int numRead = zzReader.read(zzBuffer, zzEndRead,
                                            zzBuffer.length-zzEndRead);

    if (numRead < 0) {
      return true;
    }
    else {
      zzEndRead+= numRead;
      return false;
    }
  }

    
  /**
   * Closes the input stream.
   */
  public final void yyclose() throws java.io.IOException {
    zzAtEOF = true;            /* indicate end of file */
    zzEndRead = zzStartRead;  /* invalidate buffer    */

    if (zzReader != null)
      zzReader.close();
  }


  /**
   * Resets the scanner to read from a new input stream.
   * Does not close the old reader.
   *
   * All internal variables are reset, the old input stream 
   * <b>cannot</b> be reused (internal buffer is discarded and lost).
   * Lexical state is set to <tt>ZZ_INITIAL</tt>.
   *
   * @param reader   the new input stream 
   */
  public final void yyreset(java.io.Reader reader) {
    zzReader = reader;
    zzAtBOL  = true;
    zzAtEOF  = false;
    zzEndRead = zzStartRead = 0;
    zzCurrentPos = zzMarkedPos = zzPushbackPos = 0;
    yyline = yychar = yycolumn = 0;
    zzLexicalState = YYINITIAL;
  }


  /**
   * Returns the current lexical state.
   */
  public final int yystate() {
    return zzLexicalState;
  }


  /**
   * Enters a new lexical state
   *
   * @param newState the new lexical state
   */
  public final void yybegin(int newState) {
    zzLexicalState = newState;
  }


  /**
   * Returns the text matched by the current regular expression.
   */
  public final String yytext() {
    return new String( zzBuffer, zzStartRead, zzMarkedPos-zzStartRead );
  }


  /**
   * Returns the character at position <tt>pos</tt> from the 
   * matched text. 
   * 
   * It is equivalent to yytext().charAt(pos), but faster
   *
   * @param pos the position of the character to fetch. 
   *            A value from 0 to yylength()-1.
   *
   * @return the character at position pos
   */
  public final char yycharat(int pos) {
    return zzBuffer[zzStartRead+pos];
  }


  /**
   * Returns the length of the matched text region.
   */
  public final int yylength() {
    return zzMarkedPos-zzStartRead;
  }


  /**
   * Reports an error that occured while scanning.
   *
   * In a wellformed scanner (no or only correct usage of 
   * yypushback(int) and a match-all fallback rule) this method 
   * will only be called with things that "Can't Possibly Happen".
   * If this method is called, something is seriously wrong
   * (e.g. a JFlex bug producing a faulty scanner etc.).
   *
   * Usual syntax/scanner level error handling should be done
   * in error fallback rules.
   *
   * @param   errorCode  the code of the errormessage to display
   */
  private void zzScanError(int errorCode) {
    String message;
    try {
      message = ZZ_ERROR_MSG[errorCode];
    }
    catch (ArrayIndexOutOfBoundsException e) {
      message = ZZ_ERROR_MSG[ZZ_UNKNOWN_ERROR];
    }

    throw new Error(message);
  } 


  /**
   * Pushes the specified amount of characters back into the input stream.
   *
   * They will be read again by then next call of the scanning method
   *
   * @param number  the number of characters to be read again.
   *                This number must not be greater than yylength()!
   */
  public void yypushback(int number)  {
    if ( number > yylength() )
      zzScanError(ZZ_PUSHBACK_2BIG);

    zzMarkedPos -= number;
  }


  /**
   * Resumes scanning until the next regular expression is matched,
   * the end of input is encountered or an I/O-Error occurs.
   *
   * @return      the next token
   * @exception   java.io.IOException  if any I/O-Error occurs
   */
  public java_cup.runtime.Symbol next_token() throws java.io.IOException, ParseException {
    int zzInput;
    int zzAction;

    // cached fields:
    int zzCurrentPosL;
    int zzMarkedPosL;
    int zzEndReadL = zzEndRead;
    char [] zzBufferL = zzBuffer;
    char [] zzCMapL = ZZ_CMAP;

    int [] zzTransL = ZZ_TRANS;
    int [] zzRowMapL = ZZ_ROWMAP;
    int [] zzAttrL = ZZ_ATTRIBUTE;

    while (true) {
      zzMarkedPosL = zzMarkedPos;

      yychar+= zzMarkedPosL-zzStartRead;

      boolean zzR = false;
      for (zzCurrentPosL = zzStartRead; zzCurrentPosL < zzMarkedPosL;
                                                             zzCurrentPosL++) {
        switch (zzBufferL[zzCurrentPosL]) {
        case '\u000B':
        case '\u000C':
        case '\u0085':
        case '\u2028':
        case '\u2029':
          yyline++;
          yycolumn = 0;
          zzR = false;
          break;
        case '\r':
          yyline++;
          yycolumn = 0;
          zzR = true;
          break;
        case '\n':
          if (zzR)
            zzR = false;
          else {
            yyline++;
            yycolumn = 0;
          }
          break;
        default:
          zzR = false;
          yycolumn++;
        }
      }

      if (zzR) {
        // peek one character ahead if it is \n (if we have counted one line too much)
        boolean zzPeek;
        if (zzMarkedPosL < zzEndReadL)
          zzPeek = zzBufferL[zzMarkedPosL] == '\n';
        else if (zzAtEOF)
          zzPeek = false;
        else {
          boolean eof = zzRefill();
          zzEndReadL = zzEndRead;
          zzMarkedPosL = zzMarkedPos;
          zzBufferL = zzBuffer;
          if (eof) 
            zzPeek = false;
          else 
            zzPeek = zzBufferL[zzMarkedPosL] == '\n';
        }
        if (zzPeek) yyline--;
      }
      zzAction = -1;

      zzCurrentPosL = zzCurrentPos = zzStartRead = zzMarkedPosL;
  
      zzState = zzLexicalState;


      zzForAction: {
        while (true) {
    
          if (zzCurrentPosL < zzEndReadL)
            zzInput = zzBufferL[zzCurrentPosL++];
          else if (zzAtEOF) {
            zzInput = YYEOF;
            break zzForAction;
          }
          else {
            // store back cached positions
            zzCurrentPos  = zzCurrentPosL;
            zzMarkedPos   = zzMarkedPosL;
            boolean eof = zzRefill();
            // get translated positions and possibly new buffer
            zzCurrentPosL  = zzCurrentPos;
            zzMarkedPosL   = zzMarkedPos;
            zzBufferL      = zzBuffer;
            zzEndReadL     = zzEndRead;
            if (eof) {
              zzInput = YYEOF;
              break zzForAction;
            }
            else {
              zzInput = zzBufferL[zzCurrentPosL++];
            }
          }
          int zzNext = zzTransL[ zzRowMapL[zzState] + zzCMapL[zzInput] ];
          if (zzNext == -1) break zzForAction;
          zzState = zzNext;

          int zzAttributes = zzAttrL[zzState];
          if ( (zzAttributes & 1) == 1 ) {
            zzAction = zzState;
            zzMarkedPosL = zzCurrentPosL;
            if ( (zzAttributes & 8) == 8 ) break zzForAction;
          }

        }
      }

      // store back cached position
      zzMarkedPos = zzMarkedPosL;

      switch (zzAction < 0 ? zzAction : ZZ_ACTION[zzAction]) {
        case 21: 
          { /* ignore */
          }
        case 50: break;
        case 32: 
          { return symbol(Parser_sym.THIS);
          }
        case 51: break;
        case 16: 
          { return symbol(Parser_sym.TIMES);
          }
        case 52: break;
        case 25: 
          { error("unexpected */");
          }
        case 53: break;
        case 35: 
          { return symbol(Parser_sym.CHAR);
          }
        case 54: break;
        case 46: 
          { return symbol(Parser_sym.BOOL);
          }
        case 55: break;
        case 40: 
          { return symbol(Parser_sym.WHILE);
          }
        case 56: break;
        case 17: 
          { return symbol(Parser_sym.DIVIDE);
          }
        case 57: break;
        case 43: 
          { return symbol(Parser_sym.STRING);
          }
        case 58: break;
        case 31: 
          { return symbol(Parser_sym.NEW);
          }
        case 59: break;
        case 2: 
          { error("illegal token");
          }
        case 60: break;
        case 45: 
          { return symbol(Parser_sym.PUBLIC);
          }
        case 61: break;
        case 22: 
          { yybegin(YYINITIAL);
          }
        case 62: break;
        case 11: 
          { return symbol(Parser_sym.SEMICOLON);
          }
        case 63: break;
        case 15: 
          { return symbol(Parser_sym.MINUS);
          }
        case 64: break;
        case 19: 
          { return symbol(Parser_sym.INV);
          }
        case 65: break;
        case 48: 
          { return symbol(Parser_sym.PRINT);
          }
        case 66: break;
        case 12: 
          { return symbol(Parser_sym.DOT);
          }
        case 67: break;
        case 9: 
          { return symbol(Parser_sym.RPAREN);
          }
        case 68: break;
        case 4: 
          { return symbol(Parser_sym.LBRACKET);
          }
        case 69: break;
        case 26: 
          { commentDepth = 1; yybegin(MultiLineComment);
          }
        case 70: break;
        case 41: 
          { return symbol(Parser_sym.LENGTH);
          }
        case 71: break;
        case 18: 
          { return symbol(Parser_sym.ASSIGNMENT);
          }
        case 72: break;
        case 10: 
          { return symbol(Parser_sym.COMMA);
          }
        case 73: break;
        case 39: 
          { return symbol(Parser_sym.FALSE);
          }
        case 74: break;
        case 38: 
          { return symbol(Parser_sym.CLASS);
          }
        case 75: break;
        case 5: 
          { return symbol(Parser_sym.RBRACKET);
          }
        case 76: break;
        case 24: 
          { return symbol(Parser_sym.AND);
          }
        case 77: break;
        case 42: 
          { return symbol(Parser_sym.RETURN);
          }
        case 78: break;
        case 29: 
          { commentDepth++;
          }
        case 79: break;
        case 47: 
          { return symbol(Parser_sym.EXTENDS);
          }
        case 80: break;
        case 20: 
          { return symbol(Parser_sym.INT, Integer.parseInt(yytext()));
          }
        case 81: break;
        case 49: 
          { return symbol(Parser_sym.PRINTLN);
          }
        case 82: break;
        case 44: 
          { return symbol(Parser_sym.STATIC);
          }
        case 83: break;
        case 13: 
          { return symbol(Parser_sym.LESS);
          }
        case 84: break;
        case 14: 
          { return symbol(Parser_sym.PLUS);
          }
        case 85: break;
        case 27: 
          { yybegin(SingleLineComment);
          }
        case 86: break;
        case 3: 
          { return symbol(Parser_sym.IDENTIFIER, yytext());
          }
        case 87: break;
        case 23: 
          { return symbol(Parser_sym.IF);
          }
        case 88: break;
        case 33: 
          { return symbol(Parser_sym.TRUE);
          }
        case 89: break;
        case 28: 
          { commentDepth--; if (commentDepth==0) yybegin(YYINITIAL);
          }
        case 90: break;
        case 6: 
          { return symbol(Parser_sym.LCURL);
          }
        case 91: break;
        case 8: 
          { return symbol(Parser_sym.LPAREN);
          }
        case 92: break;
        case 30: 
          { return symbol(Parser_sym.INTTYPE);
          }
        case 93: break;
        case 37: 
          { return symbol(Parser_sym.VOID);
          }
        case 94: break;
        case 7: 
          { return symbol(Parser_sym.RCURL);
          }
        case 95: break;
        case 34: 
          { return symbol(Parser_sym.ELSE);
          }
        case 96: break;
        case 36: 
          { return symbol(Parser_sym.MAIN);
          }
        case 97: break;
        case 1: 
          { 
          }
        case 98: break;
        default: 
          if (zzInput == YYEOF && zzStartRead == zzCurrentPos) {
            zzAtEOF = true;
              {   {
    if (commentDepth > 0) {
       error("runaway comment");
    }
    return symbol(Parser_sym.EOF);
  }
 }
          } 
          else {
            zzScanError(ZZ_NO_MATCH);
          }
      }
    }
  }


}
