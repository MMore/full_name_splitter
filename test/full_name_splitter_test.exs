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
    assert FullNameSplitter.split("Ken E. Mark Slater") == {"Ken E. Mark", "Slater"}

    assert FullNameSplitter.split("Marie-Anne Richmond-Smithe") ==
             {"Marie-Anne", "Richmond-Smithe"}
  end

  test "splits names with prefix in last_name" do
    assert FullNameSplitter.split("Gabriel Van Helsing") == {"Gabriel", "Van Helsing"}
    assert FullNameSplitter.split("Pierre de Montesquiou") == {"Pierre", "de Montesquiou"}
    assert FullNameSplitter.split("Charles d'Artagnan") == {"Charles", "d'Artagnan"}
    assert FullNameSplitter.split("Alessandro Del Piero") == {"Alessandro", "Del Piero"}
    assert FullNameSplitter.split("Anne du Bourg") == {"Anne", "du Bourg"}
    assert FullNameSplitter.split("Juan Du Satre") == {"Juan", "Du Satre"}

    assert FullNameSplitter.split("Johann Wolfgang von Goethe") ==
             {"Johann Wolfgang", "von Goethe"}

    assert FullNameSplitter.split("Anthony R Von Fange") == {"Anthony R", "Von Fange"}

    assert FullNameSplitter.split("Leonardo da Vinci") == {"Leonardo", "da Vinci"}
    assert FullNameSplitter.split("Luca Da Gama") == {"Luca", "Da Gama"}
    assert FullNameSplitter.split("Adriano Dello Spavento") == {"Adriano", "Dello Spavento"}
    assert FullNameSplitter.split("Luca Delle Fave") == {"Luca", "Delle Fave"}
    assert FullNameSplitter.split("Francesca Della Valle") == {"Francesca", "Della Valle"}
    assert FullNameSplitter.split("Tomasso D'Arco") == {"Tomasso", "D'Arco"}
    assert FullNameSplitter.split("Juan Gaz de la Cruz") == {"Juan Gaz", "de la Cruz"}
    assert FullNameSplitter.split("Juan Gaz De La Cruz") == {"Juan Gaz", "De La Cruz"}

    assert FullNameSplitter.split("Han Vande Casteele") == {"Han", "Vande Casteele"}
    assert FullNameSplitter.split("Johan de heer Van Kampen") == {"Johan", "de heer Van Kampen"}
    assert FullNameSplitter.split("Han Van De Casteele") == {"Han", "Van De Casteele"}
    assert FullNameSplitter.split("Han S. Van De Casteele") == {"Han S.", "Van De Casteele"}
    assert FullNameSplitter.split("Albert Van Der Haart") == {"Albert", "Van Der Haart"}
    assert FullNameSplitter.split("Hans van der Hort") == {"Hans", "van der Hort"}
    assert FullNameSplitter.split("Hans van den Berg") == {"Hans", "van den Berg"}
  end

  test "splits names with suffix in last_name" do
    assert FullNameSplitter.split("John Doe Jr.") == {"John", "Doe Jr."}
    assert FullNameSplitter.split("John Doe Junior") == {"John", "Doe Junior"}

    assert FullNameSplitter.split("William Randolph Hearst Jr") ==
             {"William Randolph", "Hearst Jr"}

    assert FullNameSplitter.split("William Hearst Sr") == {"William", "Hearst Sr"}
    assert FullNameSplitter.split("William Hearst Sr.") == {"William", "Hearst Sr."}
    assert FullNameSplitter.split("William Hearst Senior") == {"William", "Hearst Senior"}

    assert FullNameSplitter.split("Anthony R Von Fange III") == {"Anthony R", "Von Fange III"}

    assert FullNameSplitter.split("John Doe I") == {"John", "Doe I"}
    assert FullNameSplitter.split("John Doe II") == {"John", "Doe II"}
    assert FullNameSplitter.split("John Doe III") == {"John", "Doe III"}
    assert FullNameSplitter.split("John Doe IV") == {"John", "Doe IV"}
    assert FullNameSplitter.split("John Doe V") == {"John", "Doe V"}
    assert FullNameSplitter.split("John Doe VI") == {"John", "Doe VI"}
  end

  test "splits umlauts" do
    assert FullNameSplitter.split("Jàáâã Martíñ Müller") == {"Jàáâã Martíñ", "Müller"}
  end

  test "splits unrecognized names in a simply way as fallback" do
    assert FullNameSplitter.split("Maria del Carmen Menendez") == {"Maria del Carmen", "Menendez"}
  end

  test "ignores whitespaces while splitting" do
    assert FullNameSplitter.split("\t George \t  H.  \tW. \t Bush \t") == {"George H. W.", "Bush"}

    assert FullNameSplitter.split("  Marie-Anne   Richmond-Smithe") ==
             {"Marie-Anne", "Richmond-Smithe"}
  end
end
