defmodule CleaningBusinessModel.MixProject do
  use Mix.Project

  def project do
    [
      app: :cleaning_business_model,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :wx, :runtime_tools, :observer],
      mod: {CleaningBusinessModel.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ecto, "~> 3.0"},
      {:decimal, "~> 2.0"},
      {:timex, "~> 3.0"}
    ]
  end
end
