defmodule TikaServerEx.RMeta do
  def get_xml_content(tika_server, bytes) when is_binary(bytes) do
    Req.put(
      "#{tika_server.url}/rmeta",
      headers: [{"Accept", "application/json"}],
      body: bytes
    )
  end

  def get_text_content(tika_server, bytes) when is_binary(bytes) do
    Req.put(
      "#{tika_server.url}/rmeta/text",
      headers: [{"Accept", "application/json"}],
      body: bytes
    )
  end

  def get_html_content(tika_server, bytes) when is_binary(bytes) do
    Req.put(
      "#{tika_server.url}/rmeta/html",
      headers: [{"Accept", "application/json"}],
      body: bytes
    )
  end

  def get_metadata_only(tika_server, bytes) when is_binary(bytes) do
    Req.put(
      "#{tika_server.url}/rmeta/ignore",
      headers: [{"Accept", "application/json"}],
      body: bytes
    )
  end
end
