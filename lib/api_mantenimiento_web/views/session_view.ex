defmodule ApiMantenimientoWeb.SessionView do
  use ApiMantenimientoWeb, :view
  alias ApiMantenimientoWeb.SessionView

  def render("show.json", %{session: token}) do
    %{data: render_one(token, SessionView, "token.json")}
  end

  def render("token.json", %{session: token}) do
    %{
      token: token
    }
  end

  def render("400.json", _assigns) do
    %{errors: %{detail: "La solicitud realizada es incorrecta, revisa la url o parametros envaiados"}}
  end
end