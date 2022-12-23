# Confrog

Your friendly Slack conference reminder frog 🐸.

> 🧪 This is a test project, no production use is intended yet.

## 👷 Development

### 📦 Install `mix` dependencies

```bash
mix deps.get
```

### 🧪 Run Confrogo tests

```bash
mix test
```

### 🏁 Run Confrogo local application

> Make sure you have `cp .env.example` and replaced the demo variables with your own.

```bash
$ env $(cat .env) mix run --no-halt
TT:TT:TT.TTT [info] The server listening at port: 8000
```

### 🧰 Or use `Makefile` 🎉

#### `make deps` - to install dependencies

#### `make test` - to run tests

#### `make start-local` - to run a local application

<!-- TODO: add this later -->
<!-- ## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `confrog` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:confrog, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/confrog>. -->
