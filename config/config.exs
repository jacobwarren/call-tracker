# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tracker,
  ecto_repos: [Tracker.Repo]

# Configures the endpoint
config :tracker, TrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oyPEqqlUkrrHU9StFlTUN1alkvUEz6/1oplkUaalB5xYM/GFkiCFO2TL1D/iEmGo",
  render_errors: [view: TrackerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Tracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Tracker.Guardian,
  allowed_algos: ["HS512"], #optional
  verify_module: Guardian.JWT, #optional
  issuer: "Tracker",
  ttl: {30, :days },
  verify_issuer: true, # optional
  secret_key: "Q/pRXuJQoZblGk4AIOHhMX0AkzuUpBS91hQVlO06PqrtRd/iAobc3CdBkMPDVYgc",
  serializer: Tracker.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
