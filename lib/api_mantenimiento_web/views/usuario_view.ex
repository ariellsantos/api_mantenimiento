defmodule ApiMantenimientoWeb.UsuarioView do
  use ApiMantenimientoWeb, :view
  alias ApiMantenimientoWeb.UsuarioView

  def render("show.json", %{usuario: usuario}) do
    %{data: render_one(usuario, UsuarioView, "usuario.json")}
  end

  def render("usuario.json",%{usuario: usuario}) do
    %{
      id: usuario.id,
      nombre: usuario.nombre,
      username: usuario.username,
      numero_empleado: usuario.numero_empleado,
      telefono: usuario.telefono || "No tiene numero registrado",
      email: usuario.email,
    }
  end
end