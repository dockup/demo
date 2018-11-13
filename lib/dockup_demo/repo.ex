defmodule DockupDemo.Repo do
  use Ecto.Repo,
    otp_app: :dockup_demo,
    adapter: Ecto.Adapters.Postgres
end
