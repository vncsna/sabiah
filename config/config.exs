# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sabiah,
  ecto_repos: [Sabiah.Repo]

# Configures the endpoint
config :sabiah, SabiahWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tggQzpT+NOK53uVU5sTV+3aR4EKLlMy9sg3Vn2lwFBzNDM6t4s0e980p09lz4GAN",
  render_errors: [view: SabiahWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Sabiah.PubSub,
  live_view: [signing_salt: "wwjugUng"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures ExTwitter OAuth
config :extwitter, :oauth, [
  consumer_key:        System.get_env("TWITTER_CONSUMER_KEY"),
  consumer_secret:     System.get_env("TWITTER_CONSUMER_SECRET"),
  access_token:        System.get_env("TWITTER_ACCESS_TOKEN"),
  access_token_secret: System.get_env("TWITTER_ACCESS_TOKEN_SECRET")
]

# Configures app variables 
config :sabiah,
  max_time: System.get_env("TWITTER_MAX_TIME") || 2.592e5

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"