defmodule ApiMantenimientoWeb.Auth.Guardian do
  @moduledoc """
  Modulo de implementación de Guardian para la autencitacación
  """
  use Guardian, otp_app: :api_mantenimiento
  alias ApiMantenimiento.Accounts.Usuario
  def subject_for_token(usuario, _claims) do
    {:ok, to_string(usuario.id)}  
  end

  def resource_from_claims(claims) do
    user_id = claims["sub"]

    case ApiMantenimiento.Accounts.get_usuario!(user_id) do
      usuario = %Usuario{} -> 
        {:ok, usuario}
      Ecto.NoResultsError ->
        {:error, "non user"}
    end
  end

end