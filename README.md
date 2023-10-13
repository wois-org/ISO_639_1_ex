# ISO_639_1_ex

ISO_639_1_ex is a simple Elixir library for converting between ISO 639-1 codes and language names.

## Installation

Add `iso_639_1_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:iso_639_1_ex, "~> 0.1.0"}
  ]
end
```

## Usage
```elixir
# Get the ISO 639-1 code for English
ISO6391.to_code("English")
#=> "en"

# Get the language name for the ISO 639-1 code "en"
ISO6391.from_code("en")
#=> "English"
```

### Documentation

The docs can be found at HexDocs. 