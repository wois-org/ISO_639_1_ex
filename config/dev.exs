import Config

config :iso_639_1_ex,
  env: "dev"

IO.inspect("Use dev config")

import_config "version_release.exs"
