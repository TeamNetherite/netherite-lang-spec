package net.topazlang.topazidea.parser;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import net.topazlang.topazidea.psi.TopazTypes.*;
%%
%class TopazLexer
%implements FlexLexer
%{
    TopazLexer() {
        this(null);
    }
%}
%unicode
%function advance
%type IElementType
%eof{ return;
%eof}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Whitespaces
///////////////////////////////////////////////////////////////////////////////////////////////////

EOL_WS           = \n | \r | \r\n
LINE_WS          = [\ \t]
WHITE_SPACE_CHAR = {EOL_WS} | {LINE_WS}
WHITE_SPACE      = {WHITE_SPACE_CHAR}+

///////////////////////////////////////////////////////////////////////////////////////////////////
// Identifier
///////////////////////////////////////////////////////////////////////////////////////////////////

IDENTIFIER = [_\p{xidstart}][\p{xidcontinue}]*
SUFFIX     = {IDENTIFIER}

///////////////////////////////////////////////////////////////////////////////////////////////////
// Literals
///////////////////////////////////////////////////////////////////////////////////////////////////

EXPONENT      = [eE] [-+]? [0-9_]+

INT_LITERAL = ( {DEC_LITERAL}
              | {HEX_LITERAL}
              | {OCT_LITERAL}
              | {BIN_LITERAL} ) {EXPONENT}? {SUFFIX}?

DEC_LITERAL = [0-9] [0-9_]*
HEX_LITERAL = "0x" [a-fA-F0-9_]*
OCT_LITERAL = "0o" [0-7_]*
BIN_LITERAL = "0b" [01_]*


CHAR_LITERAL   = ( \' ( [^\\\'\r\n] | \\[^\r\n] | "\\x" [a-fA-F0-9]+ | "\\u{" [a-fA-F0-9][a-fA-F0-9_]* "}"? )? ( \' {SUFFIX}? | \\ )? )
               | ( \' [\p{xidcontinue}]* \' {SUFFIX}? )
STRING_LITERAL = \" ( [^\\\"] | \\[^] )* ( \" {SUFFIX}? | \\ )?

INNER_EOL_DOC = ({LINE_WS}*"//!".*{EOL_WS})*({LINE_WS}*"//!".*)
// !(!a|b) is a (set) difference between a and b.
EOL_DOC_LINE  = {LINE_WS}*!(!("///".*)|("////".*))
%%

<YYINITIAL> {

}