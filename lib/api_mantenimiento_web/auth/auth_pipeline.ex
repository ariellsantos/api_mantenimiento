defmodule ApiMantenimientoWeb.Auth.AuthPipeline do
  @moduledoc """
  Modulo con el pipline basado en Guardian
  """
  use Guardian.Plug.Pipeline, otp_app: :api_mantenimiento, 
                              module: ApiMantenimientoWeb.Auth.Guardian,
                              error_handler: ApiMantenimientoWeb.Auth.AuthErrorHandler
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
end