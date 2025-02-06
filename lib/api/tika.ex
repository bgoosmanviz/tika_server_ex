defmodule TikaServerEx.Tika do
  def get_text(tika_server, bytes) when is_binary(bytes) do
    Req.put(
      "#{tika_server.url}/tika",
      headers: [{"Accept", "text/plain"}],
      body: bytes
    )
  end

  def get_json(tika_server, bytes) when is_binary(bytes) do
    Req.put(
      "#{tika_server.url}/tika",
      headers: [{"Accept", "application/json"}],
      body: bytes
    )
  end
end
