require IEx

defmodule Octalchemist.CLI do
  @moduledoc """
  Documentation for Octalchemist.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Octalchemist.hello
      :world

  """
  def main(args) do
    options = parse_arguments(args)

    Tentacat.Repositories.repo_get(
      options[:owner],
      options[:repository]
    )
    |> Map.get("name")
    |> IO.puts
  end

  def parse_arguments(args) do
    switches = [
      owner:      :string,
      repository: :string
    ]

    aliases = [
      o:    :owner,
      r:    :repository,
      repo: :repository
    ]

    OptionParser.parse(
      args,
      switches: switches,
      aliases:  aliases
    )
    |> elem(0)
  end
end
