defmodule Tracker.Guardian do
  use Guardian, otp_app: :tracker

  alias Tracker.Repo
  alias Tracker.Accounts.User

  def subject_for_token(user = %User{}, _claims), do: {:ok, "User:#{user.id}" }
  def subject_for_token(_, _), do: { :error, "Unkown resource type" }

  def resource_from_claims("User:" <> id), do: { :ok, Repo.get(User, id) }
  def resource_from_claims(_), do: { :error, "Unkown resource type" }
end
