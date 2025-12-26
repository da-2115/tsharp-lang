// The T# Programming Language v1.0.0-beta1
// TSharpLexer.g4
// Dylan Armstrong 2025

lexer grammar TSharpLexer;

WS : [ \t\r\n]+ -> skip ;
RETURN_LAMBDA: '->' ;
STRING_LITERAL: '"' (~["\\\r\n])* '"' ;
COMMA: ',' ;
SEMICOLON: ';' ;
PRINTLN: 'println' ;
CLASS: 'class' ;
MAIN: 'main' ;
VOID: 'void' ;
DOT: '.' ;
IF: 'if' ;
ELSE: 'else' ;
OPEN_CURLY_BRACE: '{' ;
CLOSE_CURLY_BRACE: '}' ;
RETURN: 'return';
PUBLIC: 'public' ;
PRIVATE: 'private' ;
ABSTRACT: 'abstract' ;
SUPER: 'super' ;
INT: 'int' ;
STRING: 'string' ;
ID: [_a-zA-Z][_a-zA-Z0-9]* ;

CHAR: 'char' ;
BOOL: 'bool' ;
FLOAT: 'float' ;
DOUBLE: 'double' ;
TRUE: 'true' ;
FALSE: 'false' ;




FOR: 'for' ;
ENUM: 'enum' ;
OVERRIDE: 'override' ;
AND: '&&' ;
OR: '||' ;
QUESTION: '?' ;
ASSIGNMENT: '=' ;
EQUIVALENCE: '==' ;
LESS_THAN: '<' ;
GREATER_THAN: '>' ;
LESS_EQUALS: '<=' ;
GREATER_EQUALS: '>=' ;
PLUS: '+' ;
MINUS: '-' ;
MULTIPLY: '*' ;
DIVIDE: '/' ;
INCREMENT: '++' ;
DECREMENT: '--' ;

PLUS_EQUALS: '+=' ;
SUB_EQUALS: '-=' ;
MUL_EQUALS: '*=' ;
DIV_EQUALS: '/=' ;
MODULUS: '%' ; 
NUM: [0-9]+ ;
FLOAT_LIT: [0-9]+ '.' [0-9]+ ;
DOUBLE_LIT: [0-9]+ '.' [0-9]+ ([eE][+-]?[0-9]+)? ;
CHAR_LIT: '\'' [^'\n] '\'' ;
ACCESS_IDENT_OPEN: '[' ;
ACCESS_IDENT_CLOSE: ']' ;
INHERITANCE_IDENT: ':' ;
OPEN_BRACKET: '(' ;
CLOSE_BRACKET: ')' ;
COMMENT: '//' ~[\r\n]* -> skip;
