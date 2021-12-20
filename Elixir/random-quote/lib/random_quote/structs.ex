defmodule Source do
  defstruct [:title, :author]
end

defmodule Quote do
  defstruct [:uid, :origin, :content, :source]
end
