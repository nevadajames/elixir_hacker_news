[![Build Status](https://travis-ci.com/nevadajames/elixir_hacker_news.svg?branch=master)](https://travis-ci.com/nevadajames/elixir_hacker_news)

# HackerNewsClient
Elixir Wrapper for HackerNews API
See https://github.com/HackerNews/API for more information.

**If you are using a version of this package prior to 0.2.0 I strongly recommend you update to >= 0.2.0**

### Methods
##### HackerNewsClient.stories/1
Returns 100 of each type of story, accepts the following types as an atom:
 - :top
 - :ask
 - :show
 - :best
 - :job
 - :new
```elixir
HackerNewsClient.stories(:show)
=>
[
  %{
    "by" => "test_user1",
    "descendants" => 0,
    "id" => 1234567,
    "score" => 3,
    "time" => 1563103333,
    "title" => "A test show story",
    "type" => "story",
    "url" => "www.example.com"
  },
  %{
    "by" => "test_user2",
    "descendants" => 5,
    "id" => 123456789,
    "kids" => [],
    "score" => 9,
    "time" => 156307333,
    "title" => "Another test show story",
    "type" => "story",
    "url" => "www.example.com"
  }, ...
]
```

--------

##### HackerNewsClient.stories/2
Returns specified amount of each type of story, accepts the following types as an atom:
 - :top
 - :ask
 - :show
 - :best
 - :job
 - :new
```elixir
HackerNewsClient.stories(:best, 2)
=>
[
  %{
    "by" => "test",
    "descendants" => 2,
    "id" => 1234567,
    "kids" => [123, 1234],
    "score" => 2000,
    "time" => 1562792333,
    "title" => "Title of story",
    "type" => "story",
    "url" => "www.example.com"
  },
  %{
    "by" => "test_2",
    "descendants" => 308,
    "id" => 1233456,
    "kids" => [123, 1234, 12345],
    "score" => 331,
    "time" => 1562953333,
    "title" => "Another test story title",
    "type" => "story",
    "url" => "www.example.com"
  }
]
```

--------

##### HackerNewsClient.story_ids/1
Returns list of ids for each type of story, accepts the following types as an atom:
 - :top
 - :ask
 - :show
 - :best
 - :job
 - :new
 
```elixir
HackerNewsClient.story_ids(:top)
=>
[20433021, 20433200, 20432800, 20433005, 20432201, 20433412, 20431511, 20433300,
20427313, 20431641, 20432130, 20430802, 20433311, 20433301, 20408741, 20433274,
20433251, 20419443, 20431725, 20431326, 20432920, 20427142, 20427122, 20428404,
20430925, 20426840, 20425185, 20419416, 20432971, 20425650, 20430197, 20431469,
20427520, 20433022, 20433320, 20432600, 20406349, 20432024, 20429952, 20418566,
20431704, 20419864, 20432746, 20430096, 20429462, 20430636, 20428266, 20420992,
20422896, 20428727, ...]

```
--------

##### HackerNewsClient.item/1
```elixir
# Accepts id as a integer and retrieves story.
HackerNewsClient.item(8863)
=>
{:ok,
 %{
   "by" => "example_user",
   "descendants" => 72,
   "id" => 1234,
   "kids" => [12, 123, 1234],
   "score" => 304,
   "time" => 1175714333,
   "title" => "Title of story",
   "type" => "story",
   "url" => "www.example.com"
 }}

```

--------

##### HackerNewsClient.user/1

```elixir
# Accepts id as a string and retrieves user information.
HackerNewsClient.user('jl')
=>
{:ok,
 %{
   "about" => "This is a test",
   "created" => 1173923333,
   "id" => "test_id",
   "karma" => 5000,
   "submitted" => [123456789, 1234567899]
 }}

```


## Installation

[Available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hacker_news_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hacker_news_client, "~> 0.2.0"}
  ]
end
```

## Contributing
Pull Request are welcome, fork it, open an issue and I'll take a look.