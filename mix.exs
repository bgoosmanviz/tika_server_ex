defmodule TikaServerEx.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/bgoosmanviz/tika_server_ex"

  def project do
    [
      app: :tika_server_ex,
      description: "Elixir client for Apache Tika Server",
      name: "TikaServerEx",
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:req, "~> 0.5.8"}
    ]
  end

  defp package do
    [
      files: [
        "lib",
        "mix.exs"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
