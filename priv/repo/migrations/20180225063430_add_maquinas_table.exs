defmodule ApiMantenimiento.Repo.Migrations.AddMaquinasTable do
  use Ecto.Migration

  def change do
    create table("maquinas") do
      add :nombre, :string
      add :modelo, :string
      add :serial, :string
      add :estatus, :string, default: "apagada"
      add :proyecto_id, references("proyectos"), on_delete: :delete_all

      timestamps()
    end
  end
end
