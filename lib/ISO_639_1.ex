defmodule ISO6391 do
  @moduledoc """
  A toolkit for working with ISO 639-1 language codes.

  ISO6391 offers functionality to:
  - Convert a language name into its respective ISO 639-1 code.
  - Fetch the language name(s) corresponding to a particular ISO 639-1 code.

  ISO 639-1 codes serve as standardized two-letter abbreviations for languages.

  ## Examples

      iex> ISO6391.to_code("French")
      "fr"

      iex> ISO6391.from_code("fr")
      "French"
  """

  @doc """
  Translates a language name into the corresponding ISO 639-1 code.

  Returns the associated ISO 639-1 code for a supplied `language_name` if available, or `nil` otherwise.

  ## Parameters

  - `language_name`: A binary representing the language name.

  ## Examples

      iex> ISO6391.to_code("Spanish")
      "es"

      iex> ISO6391.to_code("UnrecognizedLanguage")
      nil
  """
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

  @doc """
  Retrieves language name(s) mapped to a particular ISO 639-1 code.

  Returns a language name or names corresponding to the provided `code`, or `nil` if no match is found.

  ## Parameters

  - `code`: A binary representing the ISO 639-1 code.

  ## Examples

      iex> ISO6391.from_code("pt")
      "Portuguese"

      iex> ISO6391.from_code("undefined_code")
      nil

  ## Notes

  Some ISO 639-1 codes may map to multiple language names.
  In such instances, this function delivers a string, concatenating all correlated language names, separated by commas.
  """
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
