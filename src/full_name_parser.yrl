Nonterminals full_name first_name middle_names middle_name last_name_prefixes last_name_prefix_nt last_name last_name_suffix_nt.
Terminals string last_name_prefix last_name_suffix.
Rootsymbol full_name.

full_name -> first_name : {'$1', nil}.
full_name -> first_name last_name : {'$1', '$2'}.
full_name -> first_name last_name last_name_suffix_nt : {'$1', binary:list_to_bin(lists:join(" ", ['$2', '$3']))}.
full_name -> first_name last_name_prefixes last_name : {'$1', binary:list_to_bin(lists:join(" ", lists:reverse('$2') ++ ['$3']))}.
full_name -> first_name middle_names last_name : {binary:list_to_bin(lists:join(" ", ['$1'] ++ lists:reverse('$2'))), '$3'}.
full_name -> first_name middle_names last_name last_name_suffix_nt : {binary:list_to_bin(lists:join(" ", ['$1'] ++ lists:reverse('$2'))), binary:list_to_bin(lists:join(" ", ['$3', '$4']))}.
full_name -> first_name middle_names last_name_prefixes last_name : {binary:list_to_bin(lists:join(" ", ['$1'] ++ lists:reverse('$2'))), binary:list_to_bin(lists:join(" ", lists:reverse('$3') ++ ['$4']))}.
full_name -> first_name middle_names last_name_prefixes last_name last_name_suffix_nt : {binary:list_to_bin(lists:join(" ", ['$1'] ++ lists:reverse('$2'))), binary:list_to_bin(lists:join(" ", lists:reverse('$3') ++ ['$4', '$5']))}.

middle_names -> middle_name : ['$1'].
middle_names -> middle_names middle_name : ['$2'|'$1'].

last_name_prefixes -> last_name_prefix_nt : ['$1'].
last_name_prefixes -> last_name_prefixes last_name_prefix_nt : ['$2'|'$1'].

first_name -> string : extract_token('$1').
middle_name -> string : extract_token('$1').
last_name_prefix_nt -> last_name_prefix : extract_token('$1').
last_name -> string : extract_token('$1').
last_name_suffix_nt -> last_name_suffix : extract_token('$1').

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.