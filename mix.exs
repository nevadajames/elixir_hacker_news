defmodule HackerNewsClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :hacker_news_client,
      version: "0.2.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Nevada Start"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nevadajames/elixir_hacker_news"}
    ]
  end

  defp description do
    """
    Wrapper for Hacker News api
    """
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:benchee, "~> 1.0", only: :dev},
      {:httpoison, "~> 1.0"},
      {:poison, "~> 4.0"},
      {:exvcr, "~> 0.10", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
