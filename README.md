# TikaServerEx

TikaServerEx provides a client for the Apache Tika Server API.

See [Apache Tika Server wiki](https://cwiki.apache.org/confluence/display/TIKA/TikaServer#TikaServer-GettheTextofaDocument) for more information.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tika_server_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tika_server_ex, "~> 0.2.0"}
  ]
end
```

## Usage

First start the Apache Tika Server:

```bash
docker run -d -p 9998:9998 apache/tika:latest
```

Test the API by converting a DOCX:

```bash
curl -T story.docx http://localhost:9998/tika \
  -H "Accept: text/plain"
```

Use the Elixir client to convert a DOCX:

```elixir
bytes = File.read!("story.docx")
TikaServerEx.new("http://localhost:9998")
|> TikaServerEx.Tika.get_text(bytes)
|> IO.inspect()
```

Try the RMeta API too:

```elixir
bytes = File.read!("story.docx")
tika_server = TikaServerEx.new("http://localhost:9998")
TikaServerEx.RMeta.get_text_content(tika_server, bytes)
|> IO.inspect()
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/tika_server_ex>.

