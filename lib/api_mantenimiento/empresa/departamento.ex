defmodule ApiMantenimiento.Empresa.Departamento do
  use Ecto.Schema
  import Ecto.Changeset
  alias ApiMantenimiento.Empresa.Departamento


  schema "departamentos" do
    field :nombre, :string
    belongs_to :area, ApiMantenimiento.Empresa.Area

    timestamps()
  end

  @doc false
  def changeset(%Departamento{} = departamento, attrs) do
    departamento
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end
end
