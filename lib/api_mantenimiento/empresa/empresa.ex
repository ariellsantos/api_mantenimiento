defmodule ApiMantenimiento.Empresa do
  @moduledoc """
  The Empresa context.
  """

  import Ecto.Query, warn: false
  alias ApiMantenimiento.Repo

  alias ApiMantenimiento.Empresa.Maquina
  alias ApiMantenimiento.Mantenimiento
  @doc """
  Returns the list of maquinas_maquinaequipo.

  ## Examples

      iex> list_maquinas_maquinaequipo()
      [%Maquina{}, ...]

  """
  @tipos_orden_paro ~w(ajuste correctivo)
  @estatus_no_liberado ~w(proceso espera programada)
  def list_maquinas_maquinaequipo do
    Repo.all(Maquina)
  end

  @doc """
  Gets a single maquina.

  Raises `Ecto.NoResultsError` if the Maquina does not exist.

  ## Examples

      iex> get_maquina!(123)
      %Maquina{}

      iex> get_maquina!(456)
      ** (Ecto.NoResultsError)

  """
  def get_maquina!(id), do: Repo.get!(Maquina, id)

  @doc """
  Creates a maquina.

  ## Examples

      iex> create_maquina(%{field: value})
      {:ok, %Maquina{}}

      iex> create_maquina(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_maquina(attrs \\ %{}) do
    %Maquina{}
    |> Maquina.changeset(attrs)
    |> Repo.insert()
  end


  @doc """
  Updates a maquina.

  ## Examples

      iex> update_maquina(maquina, %{field: new_value})
      {:ok, %Maquina{}}

      iex> update_maquina(maquina, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_maquina(%Maquina{} = maquina, attrs) do
    maquina
    |> Maquina.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Maquina.

  ## Examples

      iex> delete_maquina(maquina)
      {:ok, %Maquina{}}

      iex> delete_maquina(maquina)
      {:error, %Ecto.Changeset{}}

  """
  def delete_maquina(%Maquina{} = maquina) do
    Repo.delete(maquina)
  end



  @doc """
  Returns an `%Ecto.Changeset{}` for tracking maquina changes.

  ## Examples

      iex> change_maquina(maquina)
      %Ecto.Changeset{source: %Maquina{}}

  """
  def change_maquina(%Maquina{} = maquina) do
    Maquina.changeset(maquina, %{})
  end


  @doc """
  Coloca la maquina con estatus de 'produccion' indicando que esta disponible
  """
  def encender_maquina(maquina_id) do
    maquina = get_maquina!(maquina_id)
    update_maquina(maquina, %{estatus: "produccion"})
  end

  @doc """
  Verifica si la maquina esta liberada y lista para ponerse en producción
  revisa las orenes de trabajo de la maquina si tiene alguna orden activa que amerite el paro de la maquina
  retorna true o false
  """
  def maquina_parada?(maquina_id) do
    maquina = get_maquina!(maquina_id)
    Mantenimiento.list_ordenes_trabajo(%{"maquina" => maquina})
    |> Enum.any?(fn orden ->
      orden.estatus in @estatus_no_liberado and orden.tipo_orden in @tipos_orden_paro
    end)
  end

  alias ApiMantenimiento.Empresa.Proyecto

  @doc """
  Returns the list of organizacion_proyecto.

  ## Examples

      iex> list_organizacion_proyecto()
      [%Proyecto{}, ...]

  """
  def list_organizacion_proyecto do
    Repo.all(Proyecto)
  end

  @doc """
  Gets a single proyecto.

  Raises `Ecto.NoResultsError` if the Proyecto does not exist.

  ## Examples

      iex> get_proyecto!(123)
      %Proyecto{}

      iex> get_proyecto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_proyecto!(id), do: Repo.get!(Proyecto, id)

  @doc """
  Creates a proyecto.

  ## Examples

      iex> create_proyecto(%{field: value})
      {:ok, %Proyecto{}}

      iex> create_proyecto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_proyecto(attrs \\ %{}) do
    %Proyecto{}
    |> Proyecto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a proyecto.

  ## Examples

      iex> update_proyecto(proyecto, %{field: new_value})
      {:ok, %Proyecto{}}

      iex> update_proyecto(proyecto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_proyecto(%Proyecto{} = proyecto, attrs) do
    proyecto
    |> Proyecto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Proyecto.

  ## Examples

      iex> delete_proyecto(proyecto)
      {:ok, %Proyecto{}}

      iex> delete_proyecto(proyecto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_proyecto(%Proyecto{} = proyecto) do
    Repo.delete(proyecto)
  end



  @doc """
  Returns an `%Ecto.Changeset{}` for tracking proyecto changes.

  ## Examples

      iex> change_proyecto(proyecto)
      %Ecto.Changeset{source: %Proyecto{}}

  """
  def change_proyecto(%Proyecto{} = proyecto) do
    Proyecto.changeset(proyecto, %{})
  end

  alias ApiMantenimiento.Empresa.Area

  @doc """
  Returns the list of organizacion_proyecto.

  ## Examples

      iex> list_organizacion_proyecto()
      [%Area{}, ...]

  """
  def list_organizacion_area do
    Repo.all(Area)
  end

  @doc """
  Gets a single area.

  Raises `Ecto.NoResultsError` if the Area does not exist.

  ## Examples

      iex> get_area!(123)
      %Area{}

      iex> get_area!(456)
      ** (Ecto.NoResultsError)

  """
  def get_area!(id), do: Repo.get!(Area, id)

  @doc """
  Creates a area.

  ## Examples

      iex> create_area(%{field: value})
      {:ok, %Area{}}

      iex> create_area(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_area(attrs \\ %{}) do
    %Area{}
    |> Area.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a area.

  ## Examples

      iex> update_area(area, %{field: new_value})
      {:ok, %Area{}}

      iex> update_area(area, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_area(%Area{} = area, attrs) do
    area
    |> Area.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Area.

  ## Examples

      iex> delete_area(area)
      {:ok, %Area{}}

      iex> delete_area(area)
      {:error, %Ecto.Changeset{}}

  """
  def delete_area(%Area{} = area) do
    Repo.delete(area)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking area changes.

  ## Examples

      iex> change_area(area)
      %Ecto.Changeset{source: %Area{}}

  """
  def change_area(%Area{} = area) do
    Area.changeset(area, %{})
  end

  alias ApiMantenimiento.Empresa.Departamento

  @doc """
  Returns the list of departamentos.

  ## Examples

      iex> list_departamentos()
      [%Departamento{}, ...]

  """
  def list_departamentos do
    Repo.all(Departamento)
  end

  @doc """
  Gets a single departamento.

  Raises `Ecto.NoResultsError` if the Departamento does not exist.

  ## Examples

      iex> get_departamento!(123)
      %Departamento{}

      iex> get_departamento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_departamento!(id), do: Repo.get!(Departamento, id)

  @doc """
  Creates a departamento.

  ## Examples

      iex> create_departamento(%{field: value})
      {:ok, %Departamento{}}

      iex> create_departamento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_departamento(attrs \\ %{}) do
    %Departamento{}
    |> Departamento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a departamento.

  ## Examples

      iex> update_departamento(departamento, %{field: new_value})
      {:ok, %Departamento{}}

      iex> update_departamento(departamento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_departamento(%Departamento{} = departamento, attrs) do
    departamento
    |> Departamento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Departamento.

  ## Examples

      iex> delete_departamento(departamento)
      {:ok, %Departamento{}}

      iex> delete_departamento(departamento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_departamento(%Departamento{} = departamento) do
    Repo.delete(departamento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking departamento changes.

  ## Examples

      iex> change_departamento(departamento)
      %Ecto.Changeset{source: %Departamento{}}

  """
  def change_departamento(%Departamento{} = departamento) do
    Departamento.changeset(departamento, %{})
  end
end
