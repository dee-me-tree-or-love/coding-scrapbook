defmodule RandomQuote.Stubs do
  import Quote
  import Source

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
