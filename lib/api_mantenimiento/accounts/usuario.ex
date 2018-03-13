defmodule ApiMantenimiento.Accounts.Usuario do
  use Ecto.Schema
  import Ecto.Changeset
  alias ApiMantenimiento.Accounts.Usuario


  schema "usuarios" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :is_staff, :boolean, default: false
    field :nombre, :string
    field :numero_empleado, :string
    field :password, :string
    field :password_confirmation, :string, virtual: true
    field :telefono, :string
    field :username, :string
    

    timestamps()
  end

  @fields_allowed [:nombre, :username, :email, :numero_empleado, :password, :telefono, :is_admin, :is_staff]
  @fields_required [:nombre, :username, :email, :numero_empleado, :password]

  @doc false
  def changeset(%Usuario{} = usuario, attrs) do
    usuario
    |> cast(attrs, @fields_allowed)
    |> validate_required(@fields_required)
    |> validate_length(:username, min: 5)
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(changeset) do
    pwd_hash = 
      get_field(changeset, :password)  
      |>Comeonin.Pbkdf2.hashpwsalt()
    put_change(changeset, :password, pwd_hash)
  end  
end
