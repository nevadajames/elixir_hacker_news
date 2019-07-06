defmodule HackerNewsClientTest do
  use ExUnit.Case
  doctest HackerNewsClient

  test "greets the world" do
    assert HackerNewsClient.hello() == :world
  end
end
