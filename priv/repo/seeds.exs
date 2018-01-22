# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tracker.Repo.insert!(%Tracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tracker.{Accounts, Campaigns, Communication, Repo}

user = %Accounts.User{
  name: "Jacob Warren",
  email: "jacob.paul.warren@gmail.com",
  password: "password",
  role: "admin",
} |> Repo.insert!

campaign = %Campaigns.Campaign{
  title: "Test Campaign",
  masked_number: "(555) 555-5555",
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
  campaign_id: campaign.id
} |> Repo.insert!

note = %Communication.Note{
  message: "This is a test message",
  call_id: call.id,
  user_id: user.id
} |> Repo.insert!
