defmodule HackerNewsClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest HackerNewsClient
  require IEx

  setup_all do
    HTTPoison.start
  end

  describe "GET story_ids" do
    test "story_ids(:top) returns list of ids" do
      use_cassette "get_top_story_ids" do
        assert is_list(HackerNewsClient.story_ids(:top))
      end

    end

    test "invalid story_ids type returns warning" do
      assert HackerNewsClient.story_ids(:invalid) == "invalid is not a valid option for story_ids/1"
    end
  end

  describe "GET stories/2" do
    test "get_stories(:top, 2) returns list of maps" do
      use_cassette "get_top_stories" do
        top_stories = HackerNewsClient.stories(:top, 2)

        Enum.each top_stories, fn story  ->
          assert(is_map(story))
        end
      end
    end

    test "stories have correct keys" do
      use_cassette "get_top_stories" do
        top_stories = HackerNewsClient.stories(:top, 2)
        required_keys = ["by", "id", "url", "title", "kids", "type", "descendants"]

        Enum.each top_stories, fn story  ->
          required_keys |> Enum.all?(&(assert(Map.has_key?(story, &1))))
        end
      end
    end

    test "invalid stories type returns warning" do
      assert HackerNewsClient.stories(:invalid, 100) == "invalid is not a valid option for stories/2"
    end
  end

  describe "GET stories/1" do
    test "get_stories(:top, 2) returns list of maps" do
      use_cassette "get_top_stories" do
        top_stories = HackerNewsClient.stories(:top, 2)

        Enum.each top_stories, fn story  ->
          assert(is_map(story))
        end
      end
    end

    test "stories have correct keys" do
      use_cassette "get_top_stories_default_count" do
        top_stories = HackerNewsClient.stories(:top)
        required_keys = ["by", "id", "title", "type"]

        Enum.each top_stories, fn story  ->
          required_keys |> Enum.all?(&(assert(Map.has_key?(story, &1))))
        end
      end
    end

    test "invalid stories type returns warning" do
      assert HackerNewsClient.stories(:invalid) == "invalid is not a valid option for stories/1"
    end
  end

  describe "GET item" do
    test "item/1 returns item as tuple" do
      use_cassette "get_item" do
        # credo:disable-for-next-line Credo.Check.Readability.LargeNumbers
        {:ok, item} =  HackerNewsClient.item(2921983)
        required_keys = ["by", "id", "text", "type"]

        assert is_map(item)
        required_keys |> Enum.all?(&(assert(Map.has_key?(item, &1))))
      end
    end
  end

  describe "GET user" do
    test "user/1 returns item as tuple" do
      use_cassette "get_user" do
        # credo:disable-for-next-line Credo.Check.Readability.LargeNumbers
        {:ok, user} =  HackerNewsClient.user('jl')
        required_keys = ["about", "id", "karma", "created"]

        assert is_map(user)
        required_keys |> Enum.all?(&(assert(Map.has_key?(user, &1))))
      end
    end
  end
end
