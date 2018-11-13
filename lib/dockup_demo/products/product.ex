defmodule DockupDemo.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset


  schema "products" do
    field :category, :string
    field :name, :string
    field :price, :decimal
    field :discount, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :category, :price, :discount])
    |> validate_required([:name, :category, :price])
  end
end
