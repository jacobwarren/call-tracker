defmodule Tracker.Auth.Guardian do
  use Guardian, otp_app: :tracker

  alias Tracker.Accounts

  def subject_for_token(%Accounts.User{} = user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    user = claims["sub"]
    {:ok, %{id: user}}
  end
end
