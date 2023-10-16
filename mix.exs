defmodule ISO6391.MixProject do
  use Mix.Project

  def project do
    [
      app: :iso_639_1_ex,
      version: "0.1.1-alpha.0",
      elixir: "~> 1.8",
      description: "iso_639_1 conversion tool ",
      package: [
        name: "iso_639_1_ex",
        files: ~w(lib .formatter.exs mix.exs README* LICENSE CHANGELOG*),
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/wois-org/ISO_639_1_ex"}
      ],
      docs: [
        main: "readme",
        extras: ["README.md", "CHANGELOG.md", "LICENSE"]
      ],
      elixirc_paths: ["lib"],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:version_release, "0.5.3", only: [:dev], runtime: false}
    ]
  end
end
