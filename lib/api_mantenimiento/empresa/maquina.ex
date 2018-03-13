defmodule ApiMantenimiento.Empresa.Maquina do
  use ApiMantenimiento, :model  

  alias ApiMantenimiento.Empresa.Maquina

  @estatus_maquinas ~w(produccion apagada fallo)

  schema "maquinas" do
    field :estatus, :string, default: "apagada"
    field :modelo, :string
    field :nombre, :string
    field :serial, :string
    belongs_to :proyecto, ApiMantenimiento.Empresa.Proyecto
    has_many :ordenes, ApiMantenimiento.Mantenimiento.Orden_trabajo

    timestamps()

  end

  @doc false
  def changeset(%Maquina{} = maquina, attrs) do
    maquina
    |> cast(attrs, [:nombre, :modelo, :serial, :estatus, :proyecto_id])
    |> validate_required([:nombre,  :proyecto_id])
    |> validate_inclusion(:estatus, @estatus_maquinas)
    |> foreign_key_constraint(:proyecto_id)

  end

end
