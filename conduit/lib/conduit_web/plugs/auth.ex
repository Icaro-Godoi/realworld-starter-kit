defmodule ConduitWeb.Plugs.Auth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
  end
end
