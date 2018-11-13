defmodule DockupDemoWeb.ProductView do
  use DockupDemoWeb, :view

  alias DockupDemo.{
    Products.Product
  }

  def get_discounted_price(%Product{} = product) do
    price = Decimal.to_float(product.price)
    if product.discount > 0 do
      price - (product.discount * price) / 100
    else
      price
    end
  end
end
