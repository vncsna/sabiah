defmodule Sabiah.Repo do
  use Ecto.Repo,
    otp_app: :sabiah,
    adapter: Ecto.Adapters.Postgres
end
