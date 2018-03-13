defmodule ApiMantenimientoWeb.Auth.AuthErrorHandler do
  @moduledoc """
  Modulo para manejar los errores en el pipeline de Guardian
  """
  import Plug.Conn
  import Logger

  def auth_error(conn, {_type, _reason}, _opts) do
    body = Poison.encode!(%{message: "Token invalido"})
    send_resp(conn, 401, body)
  end

  
end