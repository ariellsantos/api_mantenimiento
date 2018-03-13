defmodule ApiMantenimiento.Repo.Migrations.AddProyectosTable do
  use Ecto.Migration

  def change do
    create table("proyectos") do
      add :nombre, :string
      add :minutos_produccion_mes, :integer, default: 0
      add :area_id, references(:areas), on_delete: :delete_all

      timestamps()
    end
  end
end
