Definitions.
NAME = [a-zA-Z-.']+
LAST_NAME_PREFIX = Vande|Van|van|De|de|del|Del|der|Della|Delle|Dello|Der|Da|da|Du|du|Von|von|La|la|heer
WHITESPACE = [\s\t\n\r]

Rules.
{LAST_NAME_PREFIX} : {token, {last_name_prefix, TokenLine, to_binary(TokenChars)}}.
{NAME} : {token, {string, TokenLine, to_binary(TokenChars)}}.
{WHITESPACE}+ : skip_token.

Erlang code.
to_binary(Chars) ->
    list_to_binary(Chars).