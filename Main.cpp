#include <iostream>
#include <fstream>
#include <memory>
#include "antlr4-runtime.h"
#include "TSharpLexer.h"
#include "TSharpParser.h"
#include "TSharpParserBaseListener.h"
#include "TSharpExecListener.h"

using namespace antlr4;

int main(int argc, const char* argv[])
{
    if (argc < 2)
    {
        std::cerr << "Usage: tsharp <file.tsharp>" << std::endl;
        return 1;
    }

    std::ifstream stream(argv[1]);
    
    if (!stream)
    {
        std::cerr << "Error: Could not open file " << argv[1] << std::endl;
        return 1;
    }

    ANTLRInputStream input(stream);
    TSharpLexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    TSharpParser parser(&tokens);

    TSharpParser::ProgramContext* tree = parser.program();

    TSharpExecListener listener;
    tree::ParseTreeWalker::DEFAULT.walk(&listener, tree);

    return 0;
}
