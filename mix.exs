defmodule Alpaca.MixProject do
  use Mix.Project

  def project, do: [
    app:             :alpaca,
    version:         "0.1.0",
    elixir:          "~> 1.7",
    start_permanent: Mix.env == :prod,
    deps:            deps(),
  ]

  def application, do: [ extra_applications: [:logger] ]

  defp deps, do: [
    {:ex_doc,       "~> 0.19.1"},
    {:propcheck,    "~> 1.1"},    # https://hexdocs.pm/propcheck/PropCheck.html#content
    {:typed_struct, "~> 0.1.4"},  # https://hexdocs.pm/typed_struct/TypedStruct.html
  ]
end
