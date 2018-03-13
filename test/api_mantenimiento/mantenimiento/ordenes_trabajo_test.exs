defmodule ApiMantenimiento.OrdenTrabajo do
  use ApiMantenimiento.DataCase
  alias ApiMantenimiento.Mantenimiento
  alias ApiMantenimiento.Empresa
  alias ApiMantenimientoWeb.Ordenes.OrdenesTrabajo



  setup do
    
    {:ok, area}  = Empresa.create_area(%{nombre: "Some area"})
    {:ok, proyecto} = Empresa.create_proyecto(%{nombre: "Some proyecto", minutos_produccion_mes: 1400, area_id: area.id})
    {:ok, maquina} = Empresa.create_maquina(%{nombre: "Some maquina", proyecto_id: proyecto.id})
    attrs_orden = %{
      numero_orden: 1223,
    fecha_peticion: Timex.now,
    tipo_orden: "correctivo",
    descripcion: "La maquina se paro de la nada alv",
    numero_empleado: "A00002",
    maquina_id: maquina.id,
    proyecto_id: proyecto.id,
    }
    {:ok, orden } = Mantenimiento.create_orden_trabajo(attrs_orden)
    
    %{orden: orden, maquina: maquina}
  end

  test "cierra una orden de trabajo", %{orden: orden, maquina: maquina} do 
    assert maquina.estatus == "apagada"
    {:ok, orden_t} = OrdenesTrabajo.cerrar_orden(orden.id)
    assert orden_t.estatus == "realizada"
    maquina = Empresa.get_maquina!(maquina.id)
    assert maquina.estatus == "produccion"
  end

  test "cancela una orden de trabajo", %{orden: orden, maquina: maquina} do
    assert maquina.estatus == "apagada"
    {:ok, orden_t} =   OrdenesTrabajo.cancelar_orden(orden.id)
    assert orden_t.estatus == "cancelada"
    maquina = Empresa.get_maquina!(maquina.id)
    assert maquina.estatus == "produccion"
  end

  test "inciar una orden de trabajo", %{orden: orden, maquina: maquina} do
    assert maquina.estatus == "apagada"
    {:ok, orden_t} =   OrdenesTrabajo.iniciar_orden(orden.id)
    assert orden_t.estatus == "proceso"
    maquina = Empresa.get_maquina!(maquina.id)
    assert maquina.estatus == "apagada"
  end

  # test "inicia una orden de trabajo" do
  
  # end

  # test "cancela una orden de trabajo" do
  # end

end