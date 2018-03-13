defmodule ApiMantenimiento.Repo.Migrations.CreateDepartamentos do
  use Ecto.Migration

  def change do
    create table(:departamentos) do
      add :nombre, :string
      add :area_id, references(:area, on_delete: :nothing)

      timestamps()
    end

    create index(:departamentos, [:area_id])
  end
end
