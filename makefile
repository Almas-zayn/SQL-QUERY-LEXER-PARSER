
LEX = flex
YACC = bison

sql_query_parser: sql_query_parser_flex.l sql_query_parser_bison.y
	$(YACC) -d sql_query_parser_bison.y
	$(LEX) sql_query_parser_flex.l
	gcc sql_query_parser_bison.tab.c lex.yy.c /usr/local/opt/flex/lib/libfl.a -o sql_query_parser

clean:
	rm -f sql_parser sql_query_parser_bison.tab.* lex.yy.c