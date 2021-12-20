defmodule Source do
  defstruct [:title, :author]
end

defmodule Quote do
  defstruct [:uid, :origin, :content, :source]
end

defmodule RandomQuote.Stubs do
  alias Quote
  alias Source

  def quote_entries do
    for x <- 1..10,
        do: %Quote{
          uid: x,
          origin: "Marvin",
          content: "I think you ought to know I'm feeling very depressed.",
          source: %Source{title: "The Hitchhiker's Guide to the Galaxy", author: "Douglas Adams"}
        }
  end
end
