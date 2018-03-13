defmodule ApiMantenimiento.Repo.Migrations.ModifyColumnNumEmpleadoOrdenTrabajoToString do
  use Ecto.Migration

  def change do
    alter table(:ordenes_trabajo) do
      modify :numero_empleado, :string
    end
  end
end
