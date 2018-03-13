defmodule ApiMantenimiento.Mantenimiento.Orden_trabajo do
  use ApiMantenimiento, :model  

  alias ApiMantenimiento.Mantenimiento.Orden_trabajo
  @tipos_ordenes ~w(correctivo mejora fabricacion ajuste)
  @estatus_ordenes ~w(realizada cancelada proceso pendiente programada)

  schema "ordenes_trabajo" do
    field :actividad_realizada, :string
    field :comentarios, :string
    field :descripcion, :string
    field :diagnostico, :string
    field :estatus, :string, default: "pendiente"
    field :fecha_inicio, Timex.Ecto.DateTime
    field :fecha_peticion, Timex.Ecto.DateTime
    field :fecha_termino, Timex.Ecto.DateTime
    field :numero_empleado, :string
    field :numero_orden, :integer
    field :tiempo_muerto, :integer, deafault: 0
    field :tipo_orden, :string
    belongs_to :maquina, ApiMantenimiento.Empresa.Maquina
    belongs_to :proyecto, ApiMantenimiento.Empresa.Proyecto

    timestamps() 
  end

  @doc false
  def changeset(%Orden_trabajo{} = orden_trabajo, attrs) do
    orden_trabajo
    |> cast(attrs, [:numero_orden, :fecha_peticion, :fecha_inicio, :fecha_termino, :tipo_orden, :numero_empleado, :estatus, :descripcion, :diagnostico, :actividad_realizada, :comentarios, :tiempo_muerto, :maquina_id, :proyecto_id])
    |> validate_required([:numero_orden, :fecha_peticion, :tipo_orden, :descripcion, :numero_empleado, :maquina_id, :proyecto_id])
    |> validate_inclusion(:tipo_orden, @tipos_ordenes)
    |> validate_inclusion(:estatus, @estatus_ordenes)
    |> foreign_key_constraint(:maquina_id)
    |> foreign_key_constraint(:proyecto_id)
  end

  
  
end
