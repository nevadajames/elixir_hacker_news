# HackerNewsClient
Elixir Wrapper for HackerNews API
See https://github.com/HackerNews/API for more information.

#### Methods
```elixir
HackerNewsClient.stories(type)
```

Returns 100 of each type of story, accepts the following types as an atom:
 - :top
 - :ask
 - :show
 - :best
 - :job
 - :new



--------


```elixir
HackerNewsClient.story_ids(type)
```
Returns 100 of each type of story, accepts the following types as an atom:
 - :top
 - :ask
 - :show
 - :best
 - :job
 - :new
--------


```elixir
HackerNewsClient.get_item(id)
```
Accepts id as a string and retrieves story.



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hacker_news_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hacker_news_client, "~> 0.1.1"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/hacker_news_client](https://hexdocs.pm/hacker_news_client).
