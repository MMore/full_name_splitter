defmodule FullNameSplitter.MixProject do
  use Mix.Project

  @source_url "https://github.com/MMore/full_name_splitter"
  @version "1.0.2"

  def project do
    [
      app: :full_name_splitter,
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:leex, :yecc] ++ Mix.compilers(),
      source_url: @source_url,
      homepage_url: @source_url,
      description:
        "Full Name Splitter is a library to split a full name simply into first and last name.",
      package: [
        licenses: ["MIT"],
        links: %{
          "GitHub" => @source_url
        }
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false}
    ]
  end
end
