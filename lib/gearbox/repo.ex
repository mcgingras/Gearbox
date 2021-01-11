defmodule Gearbox.Repo do
  use Ecto.Repo,
    otp_app: :gearbox,
    adapter: Ecto.Adapters.Postgres
end
