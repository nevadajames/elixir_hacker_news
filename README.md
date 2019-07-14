[![Build Status](https://travis-ci.com/nevadajames/elixir_hacker_news.svg?branch=master)](https://travis-ci.com/nevadajames/elixir_hacker_news)

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

[Available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hacker_news_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hacker_news_client, "~> 0.1.1"}
  ]
end
```

## Contributing
Pull Request are welcome, fork it, open an issue and I'll take a look.