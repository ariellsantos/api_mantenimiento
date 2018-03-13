defmodule ApiMantenimiento.Repo.Migrations.AddOrdenesTrabajo do
  use Ecto.Migration

  def change do
    create table("ordenes_trabajo") do
      add :actividad_realizada, :string
      add :comentarios, :string
      add :descripcion, :string
      add :diagnostico, :string
      add :estatus, :string, default: "pendiente"
      add :fecha_inicio, :naive_datetime
      add :fecha_peticion, :naive_datetime
      add :fecha_termino, :naive_datetime
      add :numero_empleado, :integer
      add :numero_orden, :integer
      add :tiempo_muerto, :integer, default: 0
      add :tipo_orden, :string
      add :maquina_id, references("maquinas"), on_delete: :delete_all
      add :proyecto_id, references("proyectos"), on_delete: :delete_all

      timestamps()
    end
  end
end
