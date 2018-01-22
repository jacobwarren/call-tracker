defmodule Tracker.Campaigns do
  @moduledoc """
  The Campaigns context.
  """

  import Ecto.Query, warn: false
  alias Tracker.Repo

  alias Tracker.Campaigns.Campaign
  alias Tracker.Campaigns.Call

  @doc """
  Returns the list of campaigns.

  ## Examples

      iex> list_campaigns()
      [%Campaign{}, ...]

  """
  def list_campaigns do
    Repo.all(Campaign)
  end

  @doc """
  Gets a single campaign.

  Raises `Ecto.NoResultsError` if the Campaign does not exist.

  ## Examples

      iex> get_campaign!(123)
      %Campaign{}

      iex> get_campaign!(456)
      ** (Ecto.NoResultsError)

  """
  def get_campaign!(id), do: Repo.get!(Campaign, id)

  @doc """
  Creates a campaign.

  ## Examples

      iex> create_campaign(%{field: value})
      {:ok, %Campaign{}}

      iex> create_campaign(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_campaign(attrs \\ %{}) do
    %Campaign{}
    |> Campaign.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a campaign.

  ## Examples

      iex> update_campaign(campaign, %{field: new_value})
      {:ok, %Campaign{}}

      iex> update_campaign(campaign, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_campaign(%Campaign{} = campaign, attrs) do
    campaign
    |> Campaign.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Campaign.

  ## Examples

      iex> delete_campaign(campaign)
      {:ok, %Campaign{}}

      iex> delete_campaign(campaign)
      {:error, %Ecto.Changeset{}}

  """
  def delete_campaign(%Campaign{} = campaign) do
    Repo.delete(campaign)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking campaign changes.

  ## Examples

      iex> change_campaign(campaign)
      %Ecto.Changeset{source: %Campaign{}}

  """
  def change_campaign(%Campaign{} = campaign) do
    Campaign.changeset(campaign, %{})
  end

  alias Tracker.Campaigns.Call

  @doc """
  Returns the list of calls.

  ## Examples

      iex> list_calls()
      [%Call{}, ...]

  """
  def list_calls do
    Repo.all(Call)
  end

  @doc """
  Gets a single call.

  Raises `Ecto.NoResultsError` if the Call does not exist.

  ## Examples

      iex> get_call!(123)
      %Call{}

      iex> get_call!(456)
      ** (Ecto.NoResultsError)

  """
  def get_call!(id), do: Repo.get!(Call, id)

  @doc """
  Creates a call.

  ## Examples

      iex> create_call(%{field: value})
      {:ok, %Call{}}

      iex> create_call(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_call(attrs \\ %{}) do
    %Call{}
    |> Call.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a call.

  ## Examples

      iex> update_call(call, %{field: new_value})
      {:ok, %Call{}}

      iex> update_call(call, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_call(%Call{} = call, attrs) do
    call
    |> Call.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Call.

  ## Examples

      iex> delete_call(call)
      {:ok, %Call{}}

      iex> delete_call(call)
      {:error, %Ecto.Changeset{}}

  """
  def delete_call(%Call{} = call) do
    Repo.delete(call)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking call changes.

  ## Examples

      iex> change_call(call)
      %Ecto.Changeset{source: %Call{}}

  """
  def change_call(%Call{} = call) do
    Call.changeset(call, %{})
  end
end
