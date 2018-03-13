defmodule ApiMantenimiento.Mantenimiento do
  @moduledoc """
  The Mantenimiento context.
  """

  import Ecto.Query, warn: false
  alias ApiMantenimiento.Repo

  alias ApiMantenimiento.Mantenimiento.Orden_trabajo

  @doc """
  Returns the list of ordenes_trabajo_ordentrabajo.

  ## Examples

      iex> list_ordenes_trabajo_ordentrabajo()
      [%Orden_trabajo{}, ...]

  """
  def list_ordenes_trabajo(params) when map_size(params) == 0 do
    Orden_trabajo
    |> preload(:maquina)
    |> preload(:proyecto)
    |> Repo.all()
  end
  
  def list_ordenes_trabajo(params) do
    ordenes =  obtener_lista_ordenes_por(params)
    ordenes
  end

  defp obtener_lista_ordenes_por(%{"estatus" => estatus, "tipo_orden" => tipo_orden}) do
    Orden_trabajo
    |> ordenes_por_estatus(estatus)
    |> ordenes_por_tipo_orden(tipo_orden)
    |> preload(:maquina)
    |> preload(:proyecto)
    |> Repo.all()
  end

  defp obtener_lista_ordenes_por(%{"estatus" => estatus}) do
    Orden_trabajo
    |> ordenes_por_estatus(estatus)
    |> preload(:maquina)
    |> preload(:proyecto)
    |> Repo.all()
  end

  defp obtener_lista_ordenes_por(%{"maquina" => maquina}) do
    Orden_trabajo
    |> ordenes_por_maquina(maquina)
    |> Repo.all()
  end

  defp obtener_lista_ordenes_por(%{"maquina" => maquina, "estatus" => estatus}) do
    Orden_trabajo
    |> ordenes_por_maquina(maquina)
    |> ordenes_in_estatus(estatus)
    |> Repo.all()
  end

  defp obtener_lista_ordenes_por(%{"tipo_orden" => tipo_orden}) do
    Orden_trabajo
    |> ordenes_por_tipo_orden(tipo_orden)
    |> preload(:maquina)
    |> preload(:proyecto)
    |> Repo.all()
  end


  defp ordenes_por_maquina(query, maquina) do
    from o in query,
    where: o.maquina_id == ^maquina.id
  end

  defp ordenes_in_estatus(query, estatus) do
    from o in query,
    where: o.estatus in ^estatus
  end

  defp ordenes_por_estatus(query, estatus) do
    from o in query,
    where: o.estatus == ^estatus
  end

  defp ordenes_por_tipo_orden(query, tipo_orden) do
    from o in query, 
    where: o.tipo_orden == ^tipo_orden
  end



  @doc """
  Gets a single orden_trabajo.

  Raises `Ecto.NoResultsError` if the Orden trabajo does not exist.

  ## Examples

      iex> get_orden_trabajo!(123)
      %Orden_trabajo{}

      iex> get_orden_trabajo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_orden_trabajo!(id) do 
    Orden_trabajo
    |> preload(:maquina)
    |> preload(:proyecto)
    |> Repo.get!(id)
  end

  @doc """
  Creates a orden_trabajo.

  ## Examples

      iex> create_orden_trabajo(%{field: value})
      {:ok, %Orden_trabajo{}}

      iex> create_orden_trabajo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_orden_trabajo(attrs \\ %{}) do
    %Orden_trabajo{}
    |> Orden_trabajo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a orden_trabajo.

  ## Examples

      iex> update_orden_trabajo(orden_trabajo, %{field: new_value})
      {:ok, %Orden_trabajo{}}

      iex> update_orden_trabajo(orden_trabajo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_orden_trabajo(%Orden_trabajo{} = orden_trabajo, attrs) do
    orden_trabajo
    |> Orden_trabajo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Orden_trabajo.

  ## Examples

      iex> delete_orden_trabajo(orden_trabajo)
      {:ok, %Orden_trabajo{}}

      iex> delete_orden_trabajo(orden_trabajo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_orden_trabajo(%Orden_trabajo{} = orden_trabajo) do
    Repo.delete(orden_trabajo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking orden_trabajo changes.

  ## Examples

      iex> change_orden_trabajo(orden_trabajo)
      %Ecto.Changeset{source: %Orden_trabajo{}}

  """
  def change_orden_trabajo(%Orden_trabajo{} = orden_trabajo) do
    Orden_trabajo.changeset(orden_trabajo, %{})
  end


end
