/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_FOO_TAB_H_INCLUDED
# define YY_YY_FOO_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
<<<<<<< HEAD
    ID = 258,
    FLOATPT = 259,
    INTEGER = 260,
    STRING = 261,
    IF = 262,
    WHILE = 263,
    ELSE = 264,
    OP = 265,
    COP = 266,
    AOP = 267,
    IOP = 268
=======
    VOID = 258,
    TYPE = 259,
    ID = 260,
    RETURN = 261,
    FLOATPT = 262,
    INTEGER = 263,
    CHAR = 264,
    PARAMS = 265,
    CALLPARAMS = 266,
    STRING = 267,
    IF = 268,
    WHILE = 269,
    ELSE = 270,
    OP = 271,
    COP = 272,
    AOP = 273,
    IOP = 274
>>>>>>> 31601c60eecd415a7f2b7235c899ecdb37cbd19a
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 1 "foo.y" /* yacc.c:1909  */

	int i;
	float x;
	char c;
	int s;

<<<<<<< HEAD
#line 75 "foo.tab.h" /* yacc.c:1909  */
=======
#line 81 "foo.tab.h" /* yacc.c:1909  */
>>>>>>> 31601c60eecd415a7f2b7235c899ecdb37cbd19a
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_FOO_TAB_H_INCLUDED  */
