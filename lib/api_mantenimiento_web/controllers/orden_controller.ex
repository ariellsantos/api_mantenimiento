defmodule ApiMantenimientoWeb.OrdenController do
  use ApiMantenimientoWeb, :controller
  
  import Logger
  alias ApiMantenimiento.Mantenimiento
  alias ApiMantenimientoWeb.Ordenes.OrdenesTrabajo
  

  def index(conn, params) do
    Logger.info("#{inspect params}")
    ordenes = Mantenimiento.list_ordenes_trabajo params
    render conn, "index.json", ordenes: ordenes
  end

  def show(conn, %{"id" => id}) do
    orden = Mantenimiento.get_orden_trabajo!(id)
    render conn, "show.json", orden: orden
  end

  def cancelar(conn, %{"id" => id }) do
    case OrdenesTrabajo.cancelar_orden(id) do
      {:ok, orden} ->
        conn
        |> put_status(:ok)
        render conn, "show.json", orden: orden
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        render conn, "error.json", changeset: changeset

    end
  end

  def iniciar(conn, %{"id" => id }) do
    case OrdenesTrabajo.iniciar_orden(id) do
      {:ok, orden} ->
        conn
        |> put_status(:ok)
        render conn, "show.json", orden: orden
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        render conn, "error.json", changeset: changeset

    end
  end

  def cerrar(conn, %{"id" => id}) do
    case OrdenesTrabajo.cerrar_orden(id) do
      {:ok, orden} ->
        conn
        |> put_status(:ok)
        render conn, "show.json", orden: orden
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        render conn, "error.json", changeset: changeset

    end
  end


end