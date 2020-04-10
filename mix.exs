defmodule PortsScanner.MixProject do
  use Mix.Project

  def project do
    [
      app: :ports_scanner,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      name: "Ports scanner",
      description: description(),
      package: package(),
      source_url: "https://github.com/cardoso010/ports_scanner"
    ]
  end

  defp escript do
    [main_module: PortsScanner.CLI]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PortsScanner.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:credo, "~> 1.3"},
      {:excoveralls, "~> 0.11", only: :test},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp description do
    "Application to figure out which ports are open in a specific host."
  end

  defp package do
    [
      name: "ports_scanner",
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cardoso010/ports_scanner"}
    ]
  end
end
