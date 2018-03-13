defmodule ApiMantenimiento.Empresa.Proyecto do
  use ApiMantenimiento, :model  

  alias ApiMantenimiento.Empresa.Proyecto


  schema "proyectos" do
    field :minutos_produccion_mes, :integer
    field :nombre, :string
    belongs_to :area, ApiMantenimiento.Empresa.Area
    has_many :ordenes, ApiMantenimiento.Mantenimiento.Orden_trabajo
    has_many :maquinas, ApiMantenimiento.Empresa.Maquina

    timestamps()
  end

  @doc false
  def changeset(%Proyecto{} = proyecto, attrs) do
    proyecto
    |> cast(attrs, [:nombre, :minutos_produccion_mes, :area_id])
    |> validate_required([:nombre, :minutos_produccion_mes, :area_id])
    |> foreign_key_constraint(:area_id)
  end
end
