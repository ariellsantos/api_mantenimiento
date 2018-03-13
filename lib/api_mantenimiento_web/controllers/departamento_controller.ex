defmodule ApiMantenimientoWeb.DepartamentoController do
  use ApiMantenimientoWeb, :controller

  alias ApiMantenimiento.Empresa
  alias ApiMantenimiento.Empresa.Departamento

  action_fallback ApiMantenimientoWeb.FallbackController

  def index(conn, _params) do
    departamentos = Empresa.list_departamentos()
    render(conn, "index.json", departamentos: departamentos)
  end

  def create(conn, %{"departamento" => departamento_params}) do
    with {:ok, %Departamento{} = departamento} <- Empresa.create_departamento(departamento_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", departamento_path(conn, :show, departamento))
      |> render("show.json", departamento: departamento)
    end
  end

  def show(conn, %{"id" => id}) do
    departamento = Empresa.get_departamento!(id)
    render(conn, "show.json", departamento: departamento)
  end

  def update(conn, %{"id" => id, "departamento" => departamento_params}) do
    departamento = Empresa.get_departamento!(id)

    with {:ok, %Departamento{} = departamento} <- Empresa.update_departamento(departamento, departamento_params) do
      render(conn, "show.json", departamento: departamento)
    end
  end

  def delete(conn, %{"id" => id}) do
    departamento = Empresa.get_departamento!(id)
    with {:ok, %Departamento{}} <- Empresa.delete_departamento(departamento) do
      send_resp(conn, :no_content, "")
    end
  end
end
