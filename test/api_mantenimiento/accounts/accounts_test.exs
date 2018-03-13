defmodule ApiMantenimiento.AccountsTest do
  use ApiMantenimiento.DataCase

  alias ApiMantenimiento.Accounts

  describe "usuarios" do
    alias ApiMantenimiento.Accounts.Usuario

    @valid_attrs %{email: "usuario@gmail.com", is_admin: true, is_staff: true, nombre: "some nombre", numero_empleado: "some numero_empleado", password: "some password", telefono: "some telefono", username: "some username"}
    @update_attrs %{email: "usuario1@gmail.com", is_admin: false, is_staff: false, nombre: "some updated nombre", numero_empleado: "some updated numero_empleado", password: "some updated password", telefono: "some updated telefono", username: "some updated username"}
    @invalid_attrs %{email: nil, is_admin: nil, is_staff: nil, nombre: nil, numero_empleado: nil, password: "password", telefono: nil, username: nil}

    def usuario_fixture(attrs \\ %{}) do
      {:ok, usuario} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_usuario()

      usuario
    end

    test "list_usuarios/0 returns all usuarios" do
      usuario = usuario_fixture()
      assert Accounts.list_usuarios() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Accounts.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      assert {:ok, %Usuario{} = usuario} = Accounts.create_usuario(@valid_attrs)
      assert usuario.email == "usuario@gmail.com"
      assert usuario.is_admin == true
      assert usuario.is_staff == true
      assert usuario.nombre == "some nombre"
      assert usuario.numero_empleado == "some numero_empleado"
      assert true == String.contains?(usuario.password, "$pbkdf2")
      assert usuario.telefono == "some telefono"
      assert usuario.username == "some username"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      assert {:ok, usuario} = Accounts.update_usuario(usuario, @update_attrs)
      assert %Usuario{} = usuario
      assert usuario.email == "usuario1@gmail.com"
      assert usuario.is_admin == false
      assert usuario.is_staff == false
      assert usuario.nombre == "some updated nombre"
      assert usuario.numero_empleado == "some updated numero_empleado"
      assert true == String.contains?(usuario.password, "$pbkdf2")
      assert usuario.telefono == "some updated telefono"
      assert usuario.username == "some updated username"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_usuario(usuario, @invalid_attrs)
      assert usuario == Accounts.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Accounts.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Accounts.change_usuario(usuario)
    end
  end
end
