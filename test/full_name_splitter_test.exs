defmodule FullNameSplitterTest do
  use ExUnit.Case

  test "splits simple names" do
    assert FullNameSplitter.split("") == {nil, nil}
    assert FullNameSplitter.split(nil) == {nil, nil}
    assert FullNameSplitter.split("John Smith") == {"John", "Smith"}
    assert FullNameSplitter.split("John") == {"John", nil}
    assert FullNameSplitter.split("George W Bush") == {"George W", "Bush"}
    assert FullNameSplitter.split("George H. W. Bush") == {"George H. W.", "Bush"}
    assert FullNameSplitter.split("George H. W. A. Bush") == {"George H. W. A.", "Bush"}
    assert FullNameSplitter.split("George H. W. A. B. Bush") == {"George H. W. A. B.", "Bush"}
    assert FullNameSplitter.split("James K. Polk") == {"James K.", "Polk"}
    assert FullNameSplitter.split("William Henry Harrison") == {"William Henry", "Harrison"}
    assert FullNameSplitter.split("John Quincy Adams") == {"John Quincy", "Adams"}
    assert FullNameSplitter.split("Kevin J. O'Connor") == {"Kevin J.", "O'Connor"}
    assert FullNameSplitter.split("Ben Butler-Sandwich") == {"Ben", "Butler-Sandwich"}
    assert FullNameSplitter.split("Noda' bi-Yehudah") == {"Noda'", "bi-Yehudah"}
  end

  test "splits names with prefix in last_name" do
    assert FullNameSplitter.split("Gabriel Van Helsing") == {"Gabriel", "Van Helsing"}
    assert FullNameSplitter.split("Pierre de Montesquiou") == {"Pierre", "de Montesquiou"}
    assert FullNameSplitter.split("Charles d'Artagnan") == {"Charles", "d'Artagnan"}
    assert FullNameSplitter.split("Alessandro Del Piero") == {"Alessandro", "Del Piero"}
    assert FullNameSplitter.split("Anne du Bourg") == {"Anne", "du Bourg"}

    assert FullNameSplitter.split("Johann Wolfgang von Goethe") ==
             {"Johann Wolfgang", "von Goethe"}

    assert FullNameSplitter.split("Leonardo da Vinci") == {"Leonardo", "da Vinci"}
    assert FullNameSplitter.split("Adriano Dello Spavento") == {"Adriano", "Dello Spavento"}
    assert FullNameSplitter.split("Luca Delle Fave") == {"Luca", "Delle Fave"}
    assert FullNameSplitter.split("Francesca Della Valle") == {"Francesca", "Della Valle"}
    assert FullNameSplitter.split("Tomasso D'Arco") == {"Tomasso", "D'Arco"}
    assert FullNameSplitter.split("Juan Gaz de la Cruz") == {"Juan Gaz", "de la Cruz"}

    assert FullNameSplitter.split("Han Vande Casteele") == {"Han", "Vande Casteele"}
    assert FullNameSplitter.split("Johan de heer Van Kampen") == {"Johan", "de heer Van Kampen"}
    assert FullNameSplitter.split("Han Van De Casteele") == {"Han", "Van De Casteele"}
    assert FullNameSplitter.split("Han S. Van De Casteele") == {"Han S.", "Van De Casteele"}
    assert FullNameSplitter.split("Albert Van Der Haart") == {"Albert", "Van Der Haart"}
  end
end
