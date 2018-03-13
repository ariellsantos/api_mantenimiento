defmodule ApiMantenimiento.EmpresaTest do
  use ApiMantenimiento.DataCase

  alias ApiMantenimiento.Empresa

  
 
  describe "organizacion_maquina" do
    alias ApiMantenimiento.Empresa.Maquina
    setup do
      {:ok, area}  = Empresa.create_area(%{nombre: "Some area"})
      {:ok, proyecto} = Empresa.create_proyecto(%{nombre: "Some proyecto", minutos_produccion_mes: 1400, area_id: area.id})
  
      %{area: area, proyecto: proyecto}
    end
    
    test "crear_maquina", %{area: area, proyecto: proyecto} do
      attrs = %{nombre: "Alguna maquina", proyecto_id: proyecto.id}
      
      {:ok, maquina} = Empresa.create_maquina(attrs)
      assert maquina.nombre == attrs.nombre
      assert maquina.proyecto_id == attrs.proyecto_id
    end
  end

  

  describe "organizacion_area" do
    alias ApiMantenimiento.Empresa.Area

    @valid_attrs %{nombre: "some nombre"}
    @update_attrs %{nombre: "some updated nombre"}
    @invalid_attrs %{nombre: nil}

    def area_fixture(attrs \\ %{}) do
      {:ok, area} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Empresa.create_area()

      area
    end

    test "list_organizacion_area/0 returns all organizacion_area" do
      area = area_fixture()
      assert Empresa.list_organizacion_area() == [area]
    end

    test "get_area!/1 returns the area with given id" do
      area = area_fixture()
      assert Empresa.get_area!(area.id) == area
    end

    test "create_area/1 with valid data creates a area" do
      assert {:ok, %Area{} = area} = Empresa.create_area(@valid_attrs)
      assert area.nombre == "some nombre"
    end

    test "create_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Empresa.create_area(@invalid_attrs)
    end

    test "update_area/2 with valid data updates the area" do
      area = area_fixture()
      assert {:ok, area} = Empresa.update_area(area, @update_attrs)
      assert %Area{} = area
      assert area.nombre == "some updated nombre"
    end

    test "update_area/2 with invalid data returns error changeset" do
      area = area_fixture()
      assert {:error, %Ecto.Changeset{}} = Empresa.update_area(area, @invalid_attrs)
      assert area == Empresa.get_area!(area.id)
    end

    test "delete_area/1 deletes the area" do
      area = area_fixture()
      assert {:ok, %Area{}} = Empresa.delete_area(area)
      assert_raise Ecto.NoResultsError, fn -> Empresa.get_area!(area.id) end
    end

    test "change_area/1 returns a area changeset" do
      area = area_fixture()
      assert %Ecto.Changeset{} = Empresa.change_area(area)
    end
  end

  describe "departamentos" do
    alias ApiMantenimiento.Empresa.Departamento

    @valid_attrs %{nombre: "some nombre"}
    @update_attrs %{nombre: "some updated nombre"}
    @invalid_attrs %{nombre: nil}

    def departamento_fixture(attrs \\ %{}) do
      {:ok, departamento} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Empresa.create_departamento()

      departamento
    end

    test "list_departamentos/0 returns all departamentos" do
      departamento = departamento_fixture()
      assert Empresa.list_departamentos() == [departamento]
    end

    test "get_departamento!/1 returns the departamento with given id" do
      departamento = departamento_fixture()
      assert Empresa.get_departamento!(departamento.id) == departamento
    end

    test "create_departamento/1 with valid data creates a departamento" do
      assert {:ok, %Departamento{} = departamento} = Empresa.create_departamento(@valid_attrs)
      assert departamento.nombre == "some nombre"
    end

    test "create_departamento/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Empresa.create_departamento(@invalid_attrs)
    end

    test "update_departamento/2 with valid data updates the departamento" do
      departamento = departamento_fixture()
      assert {:ok, departamento} = Empresa.update_departamento(departamento, @update_attrs)
      assert %Departamento{} = departamento
      assert departamento.nombre == "some updated nombre"
    end

    test "update_departamento/2 with invalid data returns error changeset" do
      departamento = departamento_fixture()
      assert {:error, %Ecto.Changeset{}} = Empresa.update_departamento(departamento, @invalid_attrs)
      assert departamento == Empresa.get_departamento!(departamento.id)
    end

    test "delete_departamento/1 deletes the departamento" do
      departamento = departamento_fixture()
      assert {:ok, %Departamento{}} = Empresa.delete_departamento(departamento)
      assert_raise Ecto.NoResultsError, fn -> Empresa.get_departamento!(departamento.id) end
    end

    test "change_departamento/1 returns a departamento changeset" do
      departamento = departamento_fixture()
      assert %Ecto.Changeset{} = Empresa.change_departamento(departamento)
    end
  end
end
