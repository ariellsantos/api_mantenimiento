defmodule ApiMantenimientoWeb.OrdenView do
  use ApiMantenimientoWeb, :view
  alias ApiMantenimientoWeb.OrdenView

  import Logger

  def render("index.json", %{ordenes: ordenes}) do
    %{data: render_many(ordenes, OrdenView, "orden.json")}
  end

  def render("show.json", %{orden: orden}) do
    %{data: render_one(orden, OrdenView, "orden.json" )}
  end

  def render("orden.json", %{orden: orden}) do
    %{
      id: orden.id,
      fechaPeticion: formato_fecha_hora(orden.fecha_peticion),
      fechaInicio: formato_fecha_hora(orden.fecha_inicio),
      fechaTermino: formato_fecha_hora(orden.fecha_termino),
      diagnostico: orden.diagnostico,
      descripcion: orden.descripcion,
      comentarios: orden.comentarios,
      actividadRealizada: orden.actividad_realizada,
      estatus: orden.estatus,
      numeroEmpleado: orden.numero_empleado,
      numeroOrden: orden.numero_orden,
      tiempoMuerto: orden.tiempo_muerto,
      tipoOrden: orden.tipo_orden,
      maquina: %{
        id: orden.maquina_equipo.id,
        nombre: orden.maquina_equipo.nombre
      },
      proyectoId: %{
        id: orden.proyecto.id,
        nombre: orden.proyecto.nombre,
        minutosProduccionMensual: orden.proyecto.minutos_produccion_mes
      }
    }
  end

  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: translate_errors(changeset)}
  end

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  defp formato_fecha_hora(fecha) when is_nil(fecha), do: nil


  defp formato_fecha_hora(fecha) do
    {:ok, datetime} = 
        Timex.to_datetime(fecha, "America/Monterrey") 
        |> Timex.format("%Y-%m-%d %H:%M", :strftime)
    datetime
  end

  

end