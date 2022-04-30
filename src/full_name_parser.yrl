Nonterminals result word.
Terminals string.
Rootsymbol result.

result -> word : {'$1', nil}.
result -> word word : {'$1', '$2'}.

word -> string : extract_token('$1').

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.