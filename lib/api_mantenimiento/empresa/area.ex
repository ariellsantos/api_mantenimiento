defmodule ApiMantenimiento.Empresa.Area do
  
  use ApiMantenimiento, :model  
  alias ApiMantenimiento.Empresa.Area

  


  schema "areas" do
    field :nombre, :string

    timestamps()
  end
  

  @doc false
  def changeset(%Area{} = area, attrs) do
    area
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end
end
