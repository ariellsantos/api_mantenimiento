defmodule ApiMantenimiento do
  @moduledoc """
  ApiMantenimiento keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def model do
    quote do
      use Ecto.Schema
      import Ecto.Changeset
      
      @timestamps_opts [type: Timex.Ecto.TimestampWithTimezone, autogenerate: {Timex.Ecto.TimestampWithTimezone, :autogenerate, []}]
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
