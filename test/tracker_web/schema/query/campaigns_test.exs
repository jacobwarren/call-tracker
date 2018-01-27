defmodule TrackerWeb.Schema.Query.CampaignsTest do
  use TrackerWeb.ConnCase, async: true

  setup do
    Tracker.Seeds.run()
  end

  @query """
  {
    campaigns {
      title
    }
  }
  """
  
  test "campaigns field returns campaigns" do
    conn = build_conn()
    conn = get conn, "/api", query: @query
    assert json_response(conn, 200) == %{"data" => %{"campaigns" => [
      %{"title" => "Christmas Campaign"},
      %{"title" => "Black Friday Campaign"}
    ]}}
  end

end
