#include <bits/stdc++.h>
#define MAX_INSTRUCTION_LENGTH 1024
#define ASSIGN "assign"
#define PRINT "print"
#define BEGIN "begin"
#define END "end"

using namespace std;

typedef struct Scope // linked list implementation of the symbol table
{
    unordered_map<string, int> symbolTable;
    Scope *enclosingScope; // pointer to store the next node
} Scope;

Scope *createScope() // function to create a new node
{
    Scope *newScope = new Scope(); // constructor to allocate memory on heap
    newScope->enclosingScope = nullptr;
    return newScope;
}

string fetchVariableName(char *line, char *instruction)
{
    char *p = strstr(line, instruction); // pointer p stores the occurence(address) of the keyword in the character array
    p = p + strlen(instruction) + 1;     // going to the address of the occurrence of that string using pointer arithmetic (array indexing) +1 to skip whitespace

    string name = "";
    while (*p != '\0' && *p != ' ') // *p denotes value at the address in the character array of the string
        name.push_back(*(p++));     // this loop iterates until it stores the name of the variable completely
                                    // pushback is a function that appends at the end of the character array.
    return name;                    // returns the name of the variable stored in the string data structure ( character array)
}

int fetchVariableValue(char *line) // as per the syntax of pascal, variable value will be at the last of the line
{
    int i = strlen(line) - 1;
    while (line[i] != ' ')
        i--;
    return stoi(line + i); // returning the variable value ny converting the string into integer using this function
}

int main()
{
    FILE *sourceFile = fopen("sourcepgm.txt", "r"); // reading source program using file handling from the file
    char line[MAX_INSTRUCTION_LENGTH];              // sourcepgm.txt
    Scope *currScope = NULL;                        // head pointer for the linked list
                                                    // temporary variable of to maintain scope of current code block (same as head pointer of linked list)

    while (fgets(line, sizeof(line), sourceFile) != nullptr) // *sourcefile is the pointer of the source file, sizeof(line) = 1024, line is the variable which sotres the data read from file
    {                                                        // loop goes through a code block and checks for the further details
        line[strlen(line) - 1] = '\0';                       // assigns the last character of the string to \0, as the string ends with it

        if (strstr(line, BEGIN) != nullptr) // strstr is function that searches for a substring inside a string. for example , here it'll search for BEGIN keyword in the line string
        {                                   // creating a new scope based on the begin keyword
            Scope *newScope = createScope();
            newScope->enclosingScope = currScope;
            currScope = newScope;
        }

        else if (strstr(line, ASSIGN) != nullptr)
        {
            // finding the variable name and storing it in the symbol table
            string varName = fetchVariableName(line, (char *)ASSIGN);
            currScope->symbolTable[varName] = fetchVariableValue(line); // stores the fetched variable value pair in symbol table
        }

        else if (strstr(line, PRINT) != nullptr)
        {

            string varName = fetchVariableName(line, (char *)PRINT);
            Scope *scope = currScope;

            while (scope != nullptr && scope->symbolTable.count(varName) == 0) // count function searches for the key in the hash map
                scope = scope->enclosingScope;

            if (scope != nullptr)
                cout << varName << " = " << scope->symbolTable[varName] << endl;
            else
            {
                cout << "error: "
                     << "'" << varName << "'"
                     << " was not declared in this scope" << endl;
            }
        }
        else
        {
            Scope *deadScope = currScope;
            currScope = currScope->enclosingScope; // if the symbol table is dead then deleting it
            delete deadScope;                      // dead means there are no variable or anything to be stored then freeing the allocated linked list
        }

    } // this will happen in loop.

    fclose(sourceFile);
    return 0;
}