// The T# Programming Language v1.0.0-beta1
// TSharpParser.g4
// Dylan Armstrong 2025

parser grammar TSharpParser;

options { tokenVocab = TSharpLexer; }
type: INT|STRING|FLOAT|DOUBLE|BOOL|CHAR|custom_type ;
custom_type: name=ID ;
program: (class)* main_function;

class: CLASS name=ID OPEN_CURLY_BRACE (field)* (constructor)+ CLOSE_CURLY_BRACE ;
field: access=(PUBLIC|PRIVATE) type_of=type name=ID;
constructor: access=(PUBLIC|PRIVATE) name=ID OPEN_BRACKET (function_arg)* CLOSE_BRACKET OPEN_CURLY_BRACE (action)* CLOSE_CURLY_BRACE;
function: type name=ID OPEN_BRACKET (function_arg)* CLOSE_BRACKET OPEN_CURLY_BRACE (action*) CLOSE_CURLY_BRACE;

main_function: VOID MAIN OPEN_BRACKET (function_arg)* CLOSE_BRACKET OPEN_CURLY_BRACE
    (action)*
CLOSE_CURLY_BRACE;
action: (println_statement|function_call|assignment|class_instantiation)+;
class_instantiation: class_name=ID name=ID ASSIGNMENT class_name=ID OPEN_BRACKET vals=(ID|NUM|STRING_LITERAL|DOUBLE_LIT|CHAR_LIT|FLOAT_LIT)* CLOSE_BRACKET;

assignment: type_of=type name=ID ASSIGNMENT val=(ID|NUM|STRING_LITERAL|DOUBLE_LIT|CHAR_LIT|FLOAT_LIT);

function_call: name=ID OPEN_BRACKET CLOSE_BRACKET;

function_arg: type_of=type name=ID;

println_statement : PRINTLN OPEN_BRACKET msg=(STRING_LITERAL|ID) CLOSE_BRACKET;

