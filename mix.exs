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
    {:ex_doc, "~> 0.19.1"},
    {:propcheck, "~> 1.1"},
  ]
end
