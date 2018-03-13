defmodule ApiMantenimiento.MantenimientoTest do
  use ApiMantenimiento.DataCase

  alias ApiMantenimiento.Mantenimiento

  describe "ordenes_trabajo_ordentrabajo" do
    alias ApiMantenimiento.Mantenimiento.Orden_trabajo

    @valid_attrs %{actividad_realizada: "some actividad_realizada", comentarios: "some comentarios", descripcion: "some descripcion", diagnostico: "some diagnostico", estatus: "pendiente", fecha_inicio: ~N[2010-04-17 14:00:00.000000], fecha_peticion: ~N[2010-04-17 14:00:00.000000], fecha_termino: ~N[2010-04-17 14:00:00.000000], numero_empleado: "42", numero_orden: 42, tiempo_muerto: 42, tipo_orden: "ajuste", maquina_id: 1, proyecto_id: 1}
    @update_attrs %{actividad_realizada: "some updated actividad_realizada", comentarios: "some updated comentarios", descripcion: "some updated descripcion", diagnostico: "some updated diagnostico", estatus: "realizada", fecha_inicio: ~N[2011-05-18 15:01:01.000000], fecha_peticion: ~N[2011-05-18 15:01:01.000000], fecha_termino: ~N[2011-05-18 15:01:01.000000], numero_empleado: "43", numero_orden: 43, tiempo_muerto: 43, tipo_orden: "ajuste"}
    @invalid_attrs %{actividad_realizada: nil, comentarios: nil, descripcion: nil, diagnostico: nil, estatus: nil, fecha_inicio: nil, fecha_peticion: nil, fecha_termino: nil, numero_empleado: nil, numero_orden: nil, tiempo_muerto: nil, tipo_orden: nil}

    def orden_trabajo_fixture(attrs \\ %{}) do
      {:ok, orden_trabajo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mantenimiento.create_orden_trabajo()

      orden_trabajo
    end



    test "create_orden_trabajo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mantenimiento.create_orden_trabajo(@invalid_attrs)
    end






  end
end
