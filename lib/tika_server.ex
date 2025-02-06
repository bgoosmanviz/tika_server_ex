defmodule TikaServerEx do
  defstruct [:url]

  def new() do
    url = Application.get_env(:tika_server_ex, :url, "http://localhost:9998")

    %__MODULE__{url: url}
  end

  def new(url) when is_binary(url) do
    %__MODULE__{url: url}
  end
end
