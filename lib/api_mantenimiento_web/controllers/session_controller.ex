defmodule ApiMantenimientoWeb.SessionController do
  use ApiMantenimientoWeb, :controller
  alias ApiMantenimientoWeb.Auth.Auth
  
  def create(conn, %{"username" => username, "password" => password}) do
    case  Auth.authenticate_user(username, password) do
      {:ok, user} ->
        {:ok, token, _} =  ApiMantenimientoWeb.Auth.Guardian.encode_and_sign(user, %{permissons: ["can_add", "can_remove"]})
        conn
        |> put_status(:ok)
        |> render("show.json" , session: token)
      {:error, _} ->
        conn
        |> put_status(:unauthorized)
        render conn, "401.json"
    end
  end

  def create(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> render("400.json")
  end
end