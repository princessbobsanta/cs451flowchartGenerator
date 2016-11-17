%union {
	int i;
	float x;
	char c;
	int s;
}

%token <s> VOID
%token <s> TYPE
%token <s> ID
%token <s> RETURN
%token <x> FLOATPT
%token <i> INTEGER
%token <s> CHAR
%token <s> PARAMS
%token <s> STRING
%token <s> IF
%token <s> WHILE
%token <s> ELSE
%token <s> OP
%token <s> COP
%token <s> AOP
%token <s> IOP
%type <s> expr
%type <s> exp
/*
%type <s> oper
%type <s> coper
%type <s> aoper
%type <s> ioper
%type <s> sexpr
%type <s> ifexpr
%type <s> whexpr
%type <s> else
*/


%left '+'


%{
	#include "fubar.h"
%}


%%


program: program fndef | {cout << "digraph {" << endl;}
    	;
fndef: VOID ID '(' params ')' block { cout << "void function defined" << endl;}
	| TYPE ID '(' params ')' returnblock { cout << "function defined" << endl;}
       	;

params: PARAMS params |
	TYPE ID |
	
	;

block: '{' statements '}'    	 
    	;

returnblock: '{' statements RETURN exp';' '}'    	 
    	;

statements:
    	statements statement   	 
    	|
    	;
statement:
	TYPE ID '=' exp ';'
	| ID'('params')'';'		//void function call
	| IF '(' expr ')' block 	{cout << "if expression found ->" << endl;
					cout << "expr= " << lookup($3) << endl; 

}
	| WHILE '(' expr ')' block 	{cout << "while expression found" << endl;}
    	| IF '(' expr ')' block ELSE block {cout << "if else expression found" << endl;}
    	| block
    	| ';'
    	| expr ';'           	{ cout << "expression " << lookup($1) << endl; }
    	//| iexpr ';'          	{ cout << "integer expression: " << fixed << setprecision(0) << lookup($1) << endl; }
    	//| sexpr ';' 		{ cout  << "string: " << '"' << lookup($1) << '"' << endl; }
	;

expr:
	exp			{//cout << lookup($1) << endl;
}
	| exp COP exp		{ string s = lookup($1); 
			  	  //cout << "iexpr: " << s << endl;
			  	  s += lookupOP($2);
			  	  //cout << "iexpr oper: " << s << endl;
			  	  s += lookup($3);
			  	  //cout << "iexpr oper iexpr: " << s << endl;
			 	  $$ = save(s); 
				  
				} 
	| ID AOP exp		{ string s = lookup($1); 
			  	  //cout << "iexpr: " << s << endl;
			  	  s += lookupOP($2);
			  	  //cout << "iexpr oper: " << s << endl;
			  	  s += lookup($3);
			  	  //cout << "iexpr oper iexpr: " << s << endl;
			 	  $$ = save(s); 
				} 
	| ID '=' exp		{ string s = lookup($1); 
			  	  //cout << "iexpr: " << s << endl;
			  	  s += "=";
			  	  //cout << "iexpr oper: " << s << endl;
			  	  s += lookup($3);
			  	  //cout << "iexpr oper iexpr: " << s << endl;
			 	  $$ = save(s); 
				}
    	;

exp:
    	INTEGER              	{ $$ = save(to_string($1)); }
	| FLOATPT              	{ $$ = save(to_string($1)); }
	| ID	              	{ $$ = $1;}
	| CHAR			{ $$ = $1;}
    	| expr OP expr    	{ string s = lookup($1); 
			  	  //cout << "iexpr: " << s << endl;
			  	  s += lookupOP($2);
			  	  //cout << "iexpr oper: " << s << endl;
			  	  s += lookup($3);
			  	  //cout << "iexpr oper iexpr: " << s << endl;
			 	  $$ = save(s); 
				}
	| ID IOP    		{ string s = lookup($1); 
			  	  //cout << "iexpr: " << s << endl;
			  	  s += lookupOP($2);
			 	  $$ = save(s); }
    	;
/*
oper:  OP 			{ $$ = $1; }
	;
coper: COP			{ $$ = $1; }
	;
aoper: AOP			{ $$ = $1; }
	;
ioper: IOP			{ $$ = $1; }
	;

sexpr: 
	STRING 			{ $$ = $1; cout << $1 << endl; }
	; 
ifexpr: IF		{$$ = $1;}
	;
whexpr: WHILE		{$$ = $1;}
	;
else: 	ELSE		{$$ = $1;}
	;
*/
   	 
%%


void yyerror(const char *s) {
	cerr << s << endl;
}


int main(void) {
	yyparse();
	return 0;
}
