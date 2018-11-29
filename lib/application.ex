defmodule Alpaca.Application do
  use Application

  def start(_type, _args),
    do: [ {Alpaca.Socket, [Alpaca.new]} ]
        |> Supervisor.start_link(strategy: :one_for_one)
end
