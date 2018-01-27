defmodule Tracker.Seeds do
  def run do
    alias Tracker.{Accounts, Campaigns, Communication, Repo}

    user = %Accounts.User{
      name: "Jacob Warren",
      email: "jacob.paul.warren@gmail.com",
      password: "password",
      role: "admin",
    } |> Repo.insert!

    christmas_campaign = %Campaigns.Campaign{
      title: "Christmas Campaign",
      masked_number: "(555) 555-5555",
      forward_number: "(806) 340-1333",
      user_id: user.id
    } |> Repo.insert!

    black_friday_campaign = %Campaigns.Campaign{
      title: "Black Friday Campaign",
      masked_number: "(806) 340-5249",
      forward_number: "(806) 340-1333",
      user_id: user.id
    } |> Repo.insert!

    call = %Campaigns.Call{
      from_number: "(555) 555-5555",
      from_city: "Oklahoma City",
      from_state: "Ok",
      from_zip: "73102",
      from_country: "US",
      from_name: "Doyle Warren",
      from_type: "Resident",
      recording_url: "https://www.youtube.com/watch?v=3G8CM-6BZC4",
      call_sid: "xxxxxx",
      call_status: "success",
      campaign_id: christmas_campaign.id
    } |> Repo.insert!


    call_2 = %Campaigns.Call{
      from_number: "(555) 555-5555",
      from_city: "Canadian",
      from_state: "Tx",
      from_zip: "79014",
      from_country: "US",
      from_name: "Curtis Warren",
      from_type: "Resident",
      recording_url: "https://www.youtube.com/watch?v=3G8CM-6BZC4",
      call_sid: "xxxxxx",
      call_status: "success",
      campaign_id: christmas_campaign.id
    } |> Repo.insert!

    call_3 = %Campaigns.Call{
      from_number: "(555) 555-5555",
      from_city: "Amarillo",
      from_state: "Tx",
      from_zip: "79109",
      from_country: "US",
      from_name: "Desi Hayes",
      from_type: "Resident",
      recording_url: "https://www.youtube.com/watch?v=3G8CM-6BZC4",
      call_sid: "xxxxxx",
      call_status: "failed",
      campaign_id: christmas_campaign.id
    } |> Repo.insert!

    note = %Communication.Note{
      message: "This is a test message",
      call_id: call.id,
      user_id: user.id
    } |> Repo.insert!

    note_2 = %Communication.Note{
      message: "This is a second test message",
      call_id: call.id,
      user_id: user.id
    } |> Repo.insert!

    :ok
  end
end
