defmodule RandomQuote.Stubs do
  import Quote
  import Source

  def get_quotes do
    {:ok,
     Enum.map(
       Enum.to_list(1..10),
       fn x ->
         %Quote{
           uid: x,
           origin: "Marvin",
           content: "I think you ought to know I'm feeling very depressed.",
           source: %Source{title: "The Hitchhiker's Guide to the Galaxy", author: "Douglas Adams"}
         }
       end
     )}
  end
end
