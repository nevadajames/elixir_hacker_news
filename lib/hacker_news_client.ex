defmodule HackerNewsClient do
  @moduledoc """
  API client for Hacker News API
  For more information checkout the project at https://github.com/nevadajames/elixir_hacker_news
  """

  @base_url  "https://hacker-news.firebaseio.com/v0"
  @response_format "json?print=pretty"
  @story_types [:top, :best, :new, :job, :ask, :show]
  @default_story_count 99

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
  @spec story_ids(atom) :: list(integer)
  def story_ids(type) when type in @story_types do
    response = get("#{@base_url}/#{to_string(type)}stories.#{@response_format}")
    elem(response, 1)
  end

  def story_ids(type) do
    "#{type} is not a valid option for story_ids/1"
  end

  @doc """
  Returns up to specified quantity of stories of the following types:
  - top
  - best
  - new
  - job
  - ask
  - show
  """
  @spec stories(atom, integer) :: list()
  def stories(type, quantity) when type in @story_types do
    type
    |>story_ids
    |> Enum.slice(0..(quantity - 1))
    |> story_item_details
  end

  def stories(type, _quantity)  do
    "#{type} is not a valid option for stories/2"
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
    type
    |>story_ids
    |> Enum.slice(0..@default_story_count)
    |> story_item_details
  end

  def stories(type)  do
    "#{type} is not a valid option for stories/1"
  end

  @doc"""
  Takes story id returns available story information
  """
  @spec item(integer) :: tuple()
  def item(item_id) do
    get("#{@base_url}/item/#{item_id}.#{@response_format}")
  end

  @doc"""
  Takes user id as string and returns available information
  """
  @spec user(String.t) :: tuple()
  def user(user_id) do
    get("#{@base_url}/user/#{user_id}.#{@response_format}")
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
    |> Task.async_stream(&item/1)
    |> Enum.into([], fn {:ok, res} -> elem(res, 1)  end)
  end
end
