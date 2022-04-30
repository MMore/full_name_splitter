defmodule FullNameSplitterTest do
  use ExUnit.Case

  test "splits simple names" do
    assert FullNameSplitter.split("") == {nil, nil}
    assert FullNameSplitter.split(nil) == {nil, nil}
    assert FullNameSplitter.split("John Smith") == {"John", "Smith"}
    assert FullNameSplitter.split("John") == {"John", nil}
    assert FullNameSplitter.split("George W Bush") == {"George W", "Bush"}
    assert FullNameSplitter.split("George H. W. Bush") == {"George H. W.", "Bush"}
    assert FullNameSplitter.split("James K. Polk") == {"James K.", "Polk"}
    assert FullNameSplitter.split("William Henry Harrison") == {"William Henry", "Harrison"}
    assert FullNameSplitter.split("John Quincy Adams") == {"John Quincy", "Adams"}
  end
end
