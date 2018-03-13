defmodule ApiMantenimientoWeb.Router do
  use ApiMantenimientoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug ApiMantenimientoWeb.Auth.AuthPipeline
  end

  scope "/", ApiMantenimientoWeb do
    pipe_through(:api)

    post "/sessions/login", SessionController, :create
    post "/sessions/logout", SessionController, :delete


  end

  scope "/", ApiMantenimientoWeb do
    pipe_through [:api, :api_auth]

    resources "/ordenes", OrdenController, only: [:index, :show] do
      put "/:id/cerrar", OrdenController, :cerrar
      put "/:id/cancelar", OrdenController, :cancelar
      put "/:id/iniciar", OrdenController, :iniciar
    end

    resources "/departamentos" , DepartamentoController
    get "/sessions/me", UsuarioController, :show
  end
end
