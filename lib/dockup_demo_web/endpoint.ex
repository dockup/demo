defmodule DockupDemoWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :dockup_demo

  socket "/socket", DockupDemoWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :dockup_demo,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_dockup_demo_key",
    signing_salt: "DKfYs9fb"

  plug DockupDemoWeb.Router

  @doc """
  Callback invoked for dynamically configuring the endpoint.
  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      config_from_env_vars =
        config
        |> load_port_from_system_env
        |> load_host_from_system_env

      {:ok, config_from_env_vars}
    else
      {:ok, config}
    end
  end

  defp load_port_from_system_env(config) do
    port = System.get_env("PORT") ||
      raise "expected the PORT environment variable to be set"

    Keyword.put(config, :http, [:inet6, port: port])
  end

  defp load_host_from_system_env(config) do
    dockup_url = Application.get_env(:dockup_demo, :dockup_demo_url_host) ||
      raise "expected DOCKUP_DEMO_URL_HOST env var to be set"

    put_in(config, [:url, :host], dockup_url)
  end
end
