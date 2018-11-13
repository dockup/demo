defmodule DockupDemo.Repo.Migrations.AddDiscounts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :discount, :integer, default: 0
    end
  end
end
