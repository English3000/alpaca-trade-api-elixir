defmodule Alpaca do
  @moduledoc ~S"""
  Elixir client for [Alpaca](https://alpaca.markets?ref_by=a3ea8f9e3e) -- a platform for [algorithmic trading](https://www.investopedia.com/articles/active-trading/101014/basics-algorithmic-trading-concepts-and-examples.asp).

  ### Setup

  1. Add `{:alpaca, "~> 0.1.0"}` to `mix.exs`
  2. Sign up [HERE](https://app.alpaca.markets/signup)!
  3. After your account has been approved, generate a secret key.
  4. Add `config :alpaca, key: <YOUR KEY ID>, secret_key: <YOUR SECRET KEY>` to `config.exs`
  """
  use TypedStruct

  @url         "https://api.alpaca.markets"
  @polygon_url "https://api.polygon.io/v1"

  @typedoc ""
  typedstruct do
    field :key,         String.t, enforce: true
    field :secret_key,  String.t, enforce: true
    field :url,         String.t, default: @url
    field :polygon_url, String.t, default: @polygon_url
  end

  @spec new(options :: [{atom, String.t}]) :: Alpaca.t
  def new(opts), do: %Alpaca{
    key:         fetch_key!(opts, :key),
    secret_key:  fetch_key!(opts, :secret_key),
    url:         get_url(opts, :url, @url),
    polygon_url: get_url(opts, :polygon_url, @polygon_url)
  }

  def fetch_key!(opts, key), do: # TODO: Add test.
    if value = get_url(opts, key),
      do:   value,
      else: raise ArgumentError, "#{key}: `#{Keyword.get(opts, key, "nil")}` is not a string"

  defp get_url(opts, key, url \\ nil) do
    with value <- Keyword.get(opts, key),
          true <- is_binary(value)
    do
      value
    else
      false -> Application.get_env(:alpaca, key, url)
    end
  end
end
