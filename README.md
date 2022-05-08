# FullNameSplitter

[![CI](https://github.com/MMore/full_name_splitter/actions/workflows/ci.yml/badge.svg)](https://github.com/MMore/full_name_splitter/actions/workflows/ci.yml) [![Hex](https://img.shields.io/hexpm/v/full_name_splitter)](https://hex.pm/packages/full_name_splitter)

Full Name Splitter is a library to split a full name simply into first and last name.

It was inspired by the [JavaScript port](https://github.com/trello/full-name-splitter). But it uses
a tokenizer built with Erlang [`leex`](https://erlang.org/doc/man/leex.html) and a parser built
with Erlang [`yecc`](https://erlang.org/doc/man/yecc.html).

## Installation

Add `full_name_splitter` to your list of dependencies in mix.exs:

```elixir
def deps do
  [
    {:full_name_splitter, "~> 1.0.0"}
  ]
end
```

## Usage

```elixir
FullNameSplitter.split("Leonardo da Vinci")
{"Leonardo", "da Vinci"}

FullNameSplitter.split("Johan de heer Van Kampen")
{"Johan", "de heer Van Kampen"}

FullNameSplitter.split("Anthony R Von Fange III")
{"Anthony R", "Von Fange III"}
```

