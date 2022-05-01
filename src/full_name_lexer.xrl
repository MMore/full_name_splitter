Definitions.
NAME = [a-zA-Z-.']+
LAST_NAME_PREFIX = Vande|Van|De|de|del|Del|Della|Delle|Dello|Der|da|du|von|la|heer
WHITESPACE = [\s\t\n\r]

Rules.
{LAST_NAME_PREFIX} : {token, {last_name_prefix, TokenLine, to_binary(TokenChars)}}.
{NAME} : {token, {string, TokenLine, to_binary(TokenChars)}}.
{WHITESPACE}+ : skip_token.

Erlang code.
to_binary(Chars) ->
    list_to_binary(Chars).