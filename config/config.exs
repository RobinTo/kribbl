# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kribbl,
  ecto_repos: [Kribbl.Repo]

# Configures the endpoint
config :kribbl, KribblWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EdoYUmQQ8gJ3M+EkzDo5pccTZW2/z616SiYBJlKjeZ03WeJlzwIv7KeJDViiGH3l",
  render_errors: [view: KribblWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Kribbl.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :kribbl, Kribbl.Auth.Guardian,
  issuer: "kribbl",
  secret_key: "AW+RkwQbG7pB2zIjAhVkI1OOV9Q68taVD+pvYGCOtX/qkj2ty4hD5yMFKfUjiUXZ"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
