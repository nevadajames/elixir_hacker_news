defmodule HackerNewsClient do
  @moduledoc """
  API client for Hacker News API
  For more information checkout the project at https://github.com/nevadajames/elixir_hacker_news
  """

  @base_url  "https://hacker-news.firebaseio.com/v0"
  @response_format "json?print=pretty"
  @story_types [:top, :best, :new, :job, :ask, :show]


  @doc """
  Returns ids of stories with given type as list of integers
  Available types are:
  - top
  - best
  - new
  - job
  - ask
  - show
  """
  @spec story_ids(atom) :: list()
  def story_ids(type) when type in @story_types do
    get("#{@base_url}/#{to_string(type)}stories.#{@response_format}")
  end

  def story_ids(type) do
    "#{type} is not a valid option for story_ids()"
  end

  @doc """
  Returns up to 100 stories of the following types:
  - top
  - best
  - new
  - job
  - ask
  - show
  """
  @spec stories(atom) :: list()
  def stories(type) when type in @story_types do
    story_ids(type)
    |> story_item_details
  end

  def stories(type)  do
    "#{type} is not a valid option for stories()"
  end

  @doc"""
  Takes story id as string and returns JSON string
  """
  @spec get_item(String.t) :: String.t
  def get_item(item_id) do
    get("#{@base_url}/item/#{item_id}.#{@response_format}")
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

  defp story_item_details(item_ids) do
    item_ids
    |> elem(1)
    |> Enum.slice(0..99)
    |> Task.async_stream(&get_item/1)
    |> Enum.into([], fn {:ok, res} -> elem(res, 1)  end)
  end
end
