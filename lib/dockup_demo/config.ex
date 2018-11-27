defmodule DockupDemo.Config do
  @moduledoc """
  This module makes it easy to override application configs (found in config/config.exs)
  using environment variables. `set_configs_from_env()` is called when
  the application starts up.
  """

  require Logger

  def set_configs_from_env do
    for {env_var, config_key, type} <- configs() do
      set_config(System.get_env(env_var), config_key, type)
    end
  end

  defp configs do
    [
      {"DOCKUP_DEMO_URL_HOST", :dockup_demo_url_host, :string},
    ]
  end

  defp set_config(nil, _, _) do
    # Do nothing if env var is not set
  end

  defp set_config("", _, _) do
    # Do nothing if env var is blank
  end

  defp set_config(env_val, config_key, :string) do
    Application.put_env(:dockup_demo, config_key, env_val)
  end
end
