defmodule DockupDemo.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset


  schema "products" do
    field :category, :string
    field :name, :string
    field :price, :decimal

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :category, :price])
    |> validate_required([:name, :category, :price])
  end
end
