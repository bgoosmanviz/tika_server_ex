defmodule TikaServerEx do
  defstruct [:url]

  def new(url) when is_binary(url) do
    %__MODULE__{url: url}
  end
end
