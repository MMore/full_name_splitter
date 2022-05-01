Nonterminals full_name first_name middle_names middle_name last_name_prefixes last_name_prefix_nt last_name.
Terminals string last_name_prefix.
Rootsymbol full_name.

full_name -> first_name : {'$1', nil}.
full_name -> first_name last_name : {'$1', '$2'}.
full_name -> first_name last_name_prefixes last_name : {'$1', binary:list_to_bin(lists:join(" ", '$2' ++ ['$3']))}.
full_name -> first_name middle_names last_name : {binary:list_to_bin(lists:join(" ", ['$1'] ++ '$2')), '$3'}.
full_name -> first_name middle_names last_name_prefixes last_name : {binary:list_to_bin(lists:join(" ", ['$1'] ++ '$2')), binary:list_to_bin(lists:join(" ", '$3' ++ ['$4']))}.

middle_names -> middle_name : ['$1'].
middle_names -> middle_names middle_name : lists:reverse(['$2'|'$1']).

last_name_prefixes -> last_name_prefix_nt : ['$1'].
last_name_prefixes -> last_name_prefixes last_name_prefix_nt : lists:reverse(['$2'|'$1']).

first_name -> string : extract_token('$1').
middle_name -> string : extract_token('$1').
last_name_prefix_nt -> last_name_prefix : extract_token('$1').
last_name -> string : extract_token('$1').

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.