defmodule ApiMantenimiento.Repo.Migrations.AddAreaTable do
  use Ecto.Migration

  def change do
    create table("areas") do
      add :nombre, :string

      timestamps()
    end
  end
end
