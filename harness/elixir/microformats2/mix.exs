defmodule MF2.MixProject do
  use Mix.Project

  def project do
    [
      app: :mf2,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: MF2]
    ]
  end

  defp deps do
    [
      {:microformats2, "~> 0.2.0"},
      {:poison, "~> 3.1"}
    ]
  end
end

