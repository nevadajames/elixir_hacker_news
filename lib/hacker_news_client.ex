defmodule HackerNewsClient do
  @moduledoc """
  Up to 500 top and new stories are at /v0/topstories and /v0/newstories. Best stories are at /v0/beststories.
  Up to 200 of the latest Ask HN, Show HN, and Job stories are at /v0/askstories, /v0/showstories, and /v0/jobstories.
  """

  @base_url  "https://hacker-news.firebaseio.com/v0"
  @response_format "json?print=pretty"

  def top_stories do
    get("#{@base_url}/topstories.#{@response_format}")
    |> print_items
  end

  def new_stories do
    get("#{@base_url}/newstories.#{@response_format}")
    |> print_items
  end

  def best_stories do
    get("#{@base_url}/beststories.#{@response_format}")
    |> print_items
  end

  def job_stories do
    get("#{@base_url}/jobstories.#{@response_format}")
    |> print_items
  end

  def show_stories do
    get("#{@base_url}/showstories.#{@response_format}")
    |> print_items
  end

  def ask_stories do
    get("#{@base_url}/askstories.#{@response_format}")
    |> print_items
  end

  defp get_item(item_id) do
    get("#{@base_url}/item/#{item_id}.#{@response_format}")
    |> elem(1)
    |> IO.inspect
 end

  defp get(url) do
    case  HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
      case Poison.decode(body) do
        {:ok, decoded} ->  {:ok, decoded}
        {:error, error} -> {:error, error}
      end
    end
  end

  defp print_items(item_ids) do
    item_ids
    |> elem(1)
    |> Enum.each(fn item_id -> get_item(item_id) end)
  end
end
