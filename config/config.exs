# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dockup_demo,
  ecto_repos: [DockupDemo.Repo]

# Configures the endpoint
config :dockup_demo, DockupDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/bd5SJbD028lZx7AIYh46YiBSLtsNctfUT71O+mvVFkmBYQpNC/jHCuR3mRj97a5",
  render_errors: [view: DockupDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DockupDemo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
