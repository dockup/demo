use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :dockup_demo, DockupDemoWeb.Endpoint,
  secret_key_base: "psNRHV88nI3S4ERTnf3VPRlAnSvKDiW63lw3WJ0y19dril8j34MrhSPJPUuzUjiv"

# Configure your database
config :dockup_demo, DockupDemo.Repo,
  username: "postgres",
  password: "postgres",
  database: "dockup_demo_prod",
  pool_size: 20
