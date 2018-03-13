defmodule ApiMantenimiento.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nombre, :string
      add :username, :string
      add :email, :string
      add :numero_empleado, :string
      add :password, :string
      add :telefono, :string
      add :is_admin, :boolean, default: false, null: false
      add :is_staff, :boolean, default: false, null: false

      timestamps()
    end

    
    create unique_index(:usuarios, [:username])
    create unique_index(:usuarios, [:email])
  end
end
