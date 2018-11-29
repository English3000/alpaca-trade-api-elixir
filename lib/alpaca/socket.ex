defmodule Alpaca.Socket do
  @moduledoc """
  TODO
  """
  use WebSockex
  use TypedStruct

  typedstruct do
    field :key,           String.t,    enforce: true
    field :secret_key,    String.t,    enforce: true
    field :url,           String.t,    enforce: true

    # TODO: v- Check whether I need these -v
    field :reconnect,     boolean,     default: true
    field :verbose,       boolean,     default: false

    field :subscriptions, [],          default: []

    field :timeout,       pos_integer, default: 1_000
    field :max_timeout,   pos_integer, default: 10_000
  end

  # TODO: Debug `%WebSockex.RequestError{code: 301, message: "Moved Permanently"}`
  def start_link([ %Alpaca{url: url, key: key, secret_key: secret_key} ]) do
    url_ = String.replace(url, ~r"https?", "ws") <> "/stream"
    WebSockex.start_link(url_, __MODULE__, %Alpaca.Socket{url: url_, key: key, secret_key: secret_key})
  end
end
