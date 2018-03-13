defmodule ApiMantenimientoWeb.UsuarioController do
  use ApiMantenimientoWeb, :controller
  import Logger
  alias ApiMantenimiento.Accounts

  def show(conn, _params) do
    ["Bearer "<>token] =  get_req_header(conn,  "authorization")
    Logger.info " EL TOKEN ES: #{inspect token}"
    
    {:ok, usuario, _claims} = ApiMantenimientoWeb.Auth.Guardian.resource_from_token(token)

    usuario = Accounts.get_usuario!(usuario.id)

    conn
    |> put_status(:ok)
    |> render("show.json", usuario: usuario)
  end
end