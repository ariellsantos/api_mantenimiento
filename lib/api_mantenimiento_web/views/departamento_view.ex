defmodule ApiMantenimientoWeb.DepartamentoView do
  use ApiMantenimientoWeb, :view
  alias ApiMantenimientoWeb.DepartamentoView

  def render("index.json", %{departamentos: departamentos}) do
    %{data: render_many(departamentos, DepartamentoView, "departamento.json")}
  end

  def render("show.json", %{departamento: departamento}) do
    %{data: render_one(departamento, DepartamentoView, "departamento.json")}
  end

  def render("departamento.json", %{departamento: departamento}) do
    %{id: departamento.id,
      nombre: departamento.nombre}
  end
end
