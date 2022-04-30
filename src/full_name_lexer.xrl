Definitions.
NAME       = [a-zA-Z-]+
WHITESPACE = [\s\t\n\r]

Rules.
{NAME}        : {token, {string, TokenLine, to_binary(TokenChars)}}.
{WHITESPACE}+ : skip_token.

Erlang code.
to_binary(Chars) ->
    list_to_binary(Chars).