defmodule Ecto.Atom do
  @moduledoc """

  Custom Type to support `:atom`

  defmodule Post do
    use Ecto.Schema
    schema "posts" do
      field :atom_field, Ecto.Atom
    end
  end
  """

  @behaviour Ecto.Type

  @impl Ecto.Type
  def type, do: :string

  @impl Ecto.Type
  def cast(value) when is_atom(value), do: {:ok, value}
  def cast(value) when is_binary(value), do: {:ok, String.to_atom(value)}
  def cast(_), do: :error

  @impl Ecto.Type
  def load(value), do: {:ok, String.to_existing_atom(value)}

  @impl Ecto.Type
  def dump(value) when is_atom(value), do: {:ok, Atom.to_string(value)}
  def dump(_), do: :error

  @impl Ecto.Type
  def embed_as(_), do: :self

  @impl Ecto.Type
  def equal?(lhs, rhs), do: lhs == rhs
end
