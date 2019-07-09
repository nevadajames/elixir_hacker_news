defmodule HackerNewsClient do
  @moduledoc """
  API client for Hacker News API
  """

  @base_url  "https://hacker-news.firebaseio.com/v0"
  @response_format "json?print=pretty"

  @doc """
  Returns up to 100 of the top stories
  """
  @spec top_stories :: list()
  def top_stories do
    get("#{@base_url}/topstories.#{@response_format}")
    |> print_items
  end

  @doc """
  Returns up to 100 new stories
  """
  @spec new_stories :: list()
  def new_stories do
    get("#{@base_url}/newstories.#{@response_format}")
    |> print_items
  end

  @doc """
  Returns up to 100 of the best stories
  """
  @spec best_stories :: list()
  def best_stories do
    get("#{@base_url}/beststories.#{@response_format}")
    |> print_items
  end

  @doc """
  Returns up to 100 job stories
  """
  @spec job_stories :: list()
  def job_stories do
    get("#{@base_url}/jobstories.#{@response_format}")
    |> print_items
  end

  @doc """
  Returns up to 100 show stories
  """
  @spec show_stories :: list()
  def show_stories do
    get("#{@base_url}/showstories.#{@response_format}")
    |> print_items
  end

  @doc """
  Returns up to 100 ask stories
  """
  @spec ask_stories :: list()
  def ask_stories do
    get("#{@base_url}/askstories.#{@response_format}")
    |> print_items
  end


  defp get_item(item_id) do
    get("#{@base_url}/item/#{item_id}.#{@response_format}")
    |> elem(1)
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
    |> Enum.slice(0..99)
    |> Enum.map(fn item_id -> get_item(item_id) end)
  end
end
