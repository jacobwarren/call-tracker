defmodule TrackerWeb.Resolvers.User do
  @doc """
  Create a user
  """
  def create_user(_parent, args, %{context: %{current_user: %{role: "admin"}}}) do
    Tracker.Accounts.create_user(args)
  end

  def create_user(_parent, _args, _resolution) do
    {:error, "You do not have permission to create new users."}
  end

  def login(params, _info) do
    with {:ok, user} <- Tracker.Accounts.authenticate(params),
         {:ok, jwt, _} <- Tracker.Auth.Guardian.encode_and_sign(
           user,
           %{},
           token_type: "access"
         ) do
      {:ok, %{token: jwt}}
    end
  end

  def update(%{id: id, user: user_params}, _info) do
    case Tracker.Accounts.get_user!(id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        Tracker.Accounts.update_user(%Tracker.Accounts.User{id: id}, user_params)
        {:ok, user}
    end
  end

  @doc """
  Get all users.
  """
  def list_users(_parent, _args, _resolution) do
    {:ok, Tracker.Accounts.list_users()}
  end

  @doc """
  Get a user by ID.
  """
  def get_user(_parent, %{id: id}, _resolution) do
    case Tracker.Accounts.get_user!(id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end
end
