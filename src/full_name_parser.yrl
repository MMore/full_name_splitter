Nonterminals full_name first_name middle_names middle_name last_name.
Terminals string.
Rootsymbol full_name.

full_name -> first_name : {'$1', nil}.
full_name -> first_name last_name : {'$1', '$2'}.
full_name -> first_name middle_names last_name : {binary:list_to_bin(lists:join(" ", ['$1'] ++ '$2')), '$3'}.

middle_names -> middle_name : ['$1'].
middle_names -> middle_names middle_name : lists:reverse(['$2'|'$1']).

first_name -> string : extract_token('$1').
middle_name -> string : extract_token('$1').
last_name -> string : extract_token('$1').

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.