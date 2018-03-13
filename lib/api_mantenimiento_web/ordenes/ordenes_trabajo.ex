defmodule ApiMantenimientoWeb.Ordenes.OrdenesTrabajo do
  @moduledoc """
  Maneja las ordenes de de trabajo
  """
  alias ApiMantenimiento.Mantenimiento
  alias ApiMantenimiento.Empresa
  alias ApiMantenimiento.Mantenimiento.Orden_trabajo


  @gen_downtime ~w(correctivo ajuste)

  @doc """
  Actualiza la orden de trabajo dada con estatus de 'cancelada'
  Si la maquina a la que pertenece la orden esta la pone con estatus de disponible
  """
  def cancelar_orden(orden_id) do
    orden = Mantenimiento.get_orden_trabajo!(orden_id)
    attrs = %{estatus: "cancelada"}

    case Mantenimiento.update_orden_trabajo(orden, attrs) do
      {:ok, orden} ->
        case Empresa.maquina_parada?(orden.maquina_id) do
          true ->
            {:ok, orden}
          false ->
            Empresa.encender_maquina(orden.maquina_id)            
            {:ok, orden}
        end
      {:error, changeset} ->
        {:error, changeset}
    end

  end

  @doc """
  Indica que la orden de trabajo a comenzado a ejecutarse cambiando su estatus a 'proceso' 
  y coloca la fecha y hora en que se puso en marcha
  """
  def iniciar_orden(orden_id) do
    orden = Mantenimiento.get_orden_trabajo!(orden_id)
    attrs = %{estatus: "proceso", fecha_inicio: Timex.now}     
    Mantenimiento.update_orden_trabajo(orden, attrs) 
  end

  @doc """
  Indica que la orden de trabajo a sido realizada cambiando su estatus a 'realizada'
  coloca la fecha en que se cerro la orden.
  Verifica que la maquina  haya sido liberada y si es así la pone disponible
  """
  def cerrar_orden(orden_id) do
    orden = Mantenimiento.get_orden_trabajo!(orden_id)
    fecha_termino = Timex.now
    tiempo_muerto = calcular_minutos_tiempo_muerto(orden, fecha_termino )
    attrs = %{estatus: "realizada", fecha_termino: fecha_termino, tiempo_muerto: tiempo_muerto }     
    case Mantenimiento.update_orden_trabajo(orden, attrs)  do
      {:ok, orden} ->
        case Empresa.maquina_parada?(orden.maquina_id) do
          true ->
            {:ok, orden}
          false ->
            Empresa.encender_maquina(orden.maquina_id)            
            {:ok, orden}
        end
      {:error, changeset} ->
        {:error, changeset}
    end
  end
  

  
  # Calcula el tiempo muerto (en minutos) que genera una orden de trabajo 
  # si la orden es de tipo 'correctivo' o 'ajuste'
  defp calcular_minutos_tiempo_muerto(%Orden_trabajo{tipo_orden: tipo_orden } = orden, fecha_termino) when tipo_orden in @gen_downtime do
    Timex.diff(orden.fecha_peticion, fecha_termino, :minutes)
  end
  defp calcular_minutos_tiempo_muerto(_), do: 0


end