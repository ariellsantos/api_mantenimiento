defmodule ApiMantenimientoWeb.Auth.Auth do
  @moduledoc """
  Modulo para verificar si las credenciales de usuario son correctas
  """
  alias ApiMantenimiento.Accounts
  alias ApiMantenimiento.Repo

  @doc """
  Verifica si existe registrado el username en el sistema.
  Si existe obtiene el recurso y lo pasa para verificar que el password sea correcto
  """
  def authenticate_user(username, password) do
    Accounts.find_by_username(username)
    |> Repo.one()
    |> check_password(password)
  end
  

  @doc """
  Haseha el password ingresado por el usuario para compararlo
  con el password guardado en el sistema 
  """
  defp check_password(nil, _), do: {:error, "username incorrecto"}
  defp check_password(usuario, password) do
    case Comeonin.Pbkdf2.checkpw(password, usuario.password) do
      true ->
        {:ok, usuario}
      false ->
        {:error, "password incorrecto"}
    end
  end
end