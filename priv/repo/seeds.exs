# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DockupDemo.Repo.insert!(%DockupDemo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias DockupDemo.{
  Repo,
  Products.Product
}

products_attrs = [
  %{
    name: "Apple iPhone Xr",
    category: "iPhone",
    price: "749"
  },
  %{
    name: "Apple iPhone Xs",
    category: "iPhone",
    price: "1000"
  },
  %{
    name: "Apple iPhone Xs Max",
    category: "iPhone",
    price: "1099"
  },
  %{
    name: "Apple Macbook Air 13",
    category: "Mac",
    price: "1199"
  },
  %{
    name: "Apple Macbook Pro 13",
    category: "Mac",
    price: "1299"
  },
  %{
    name: "Apple Macbook Pro 15",
    category: "Mac",
    price: "2399"
  },
  %{
    name: "Apple iMac Pro",
    category: "Mac",
    price: "4999"
  },
  %{
    name: "Apple Mac mini",
    category: "Mac",
    price: "799"
  },
  %{
    name: "Apple iPad Pro 11",
    category: "iPad",
    price: "799"
  },
  %{
    name: "Apple iPad Pro 12.9",
    category: "iPad",
    price: "999"
  },
  %{
    name: "Apple Watch Series 4 GPS",
    category: "Watch",
    price: "399"
  },
  %{
    name: "Apple Airpods",
    category: "Accessories",
    price: "159"
  }
]

if Repo.all(Product) == [] do
  Enum.each(products_attrs, fn product_attrs ->
    %Product{}
    |> Product.changeset(product_attrs)
    |> Repo.insert!
  end)
end
