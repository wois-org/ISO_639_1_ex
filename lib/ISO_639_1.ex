defmodule ISO6391 do
  def to_code(language_name) when language_name |> is_binary do
    ISO6391.Codes.list()
    |> Enum.find(fn %{name: code_name} ->
      code_name |> String.downcase() == language_name |> String.downcase()
    end)
    |> case do
      %{iso_639_1: code} -> code
      _ -> nil
    end
  end

  def to_code(_) do
    nil
  end

  def from_code(code) when code |> is_binary do
    ISO6391.Codes.list()
    |> Enum.filter(fn %{iso_639_1: iso_code} -> iso_code == code end)
    |> case do
      [%{name: name}] ->
        name

      [_ | _] = list ->
        list
        |> Enum.reduce(nil, fn
          %{name: name}, nil -> name
          %{name: name}, acc -> acc <> "," <> name
        end)

      [] ->
        nil
    end
  end

  def from_code(_) do
    nil
  end
end
