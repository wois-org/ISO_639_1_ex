defmodule ISO6391Test do
  use ExUnit.Case, async: true

  describe "from_code/1" do
    test "get English by code" do
      assert "English" = ISO6391.from_code("en")
    end

    test "get Nyanja languages by code" do
      assert "Chichewa,Chewa,Nyanja" = ISO6391.from_code("ny")
    end

    test "non iso code" do
      assert ISO6391.from_code("zz") |> is_nil()
    end

    test "all names" do
      ISO6391.Codes.list()
      |> Enum.each(fn
        %{iso_639_1: "ca" = code} -> assert "Catalan,Valencian" == ISO6391.from_code(code)
        %{iso_639_1: "ny" = code} -> assert "Chichewa,Chewa,Nyanja" == ISO6391.from_code(code)
        %{iso_639_1: "cu" = code} -> assert "Church Slavonic,Old Bulgarian,Old Church Slavonic" == ISO6391.from_code(code)
        %{iso_639_1: "dv" = code} -> assert "Divehi,Dhivehi,Maldivian" == ISO6391.from_code(code)
        %{iso_639_1: "nl" = code} -> assert "Dutch,Flemish" == ISO6391.from_code(code)
        %{iso_639_1: "gd" = code} -> assert "Gaelic,Scottish Gaelic" == ISO6391.from_code(code)
        %{iso_639_1: "ki" = code} -> assert "Gikuyu,Kikuyu" == ISO6391.from_code(code)
        %{iso_639_1: "kl" = code} -> assert "Greenlandic,Kalaallisut" == ISO6391.from_code(code)
        %{iso_639_1: "ht" = code} -> assert "Haitian,Haitian Creole" == ISO6391.from_code(code)
        %{iso_639_1: "kj" = code} -> assert "Kwanyama,Kuanyama" == ISO6391.from_code(code)
        %{iso_639_1: "lb" = code} -> assert "Letzeburgesch,Luxembourgish" == ISO6391.from_code(code)
        %{iso_639_1: "li" = code} -> assert "Limburgish,Limburgan,Limburger" == ISO6391.from_code(code)
        %{iso_639_1: "ro" = code} -> assert "Moldovan,Moldavian,Romanian" == ISO6391.from_code(code)
        %{iso_639_1: "nv" = code} -> assert "Navajo,Navaho" == ISO6391.from_code(code)
        %{iso_639_1: "ii" = code} -> assert "Nuosu,Sichuan Yi" == ISO6391.from_code(code)
        %{iso_639_1: "os" = code} -> assert "Ossetian,Ossetic" == ISO6391.from_code(code)
        %{iso_639_1: "pa" = code} -> assert "Panjabi,Punjabi" == ISO6391.from_code(code)
        %{iso_639_1: "ps" = code} -> assert "Pashto,Pushto" == ISO6391.from_code(code)
        %{iso_639_1: "si" = code} -> assert "Sinhala,Sinhalese" == ISO6391.from_code(code)
        %{iso_639_1: "st" = code} -> assert "Sotho,Southern" == ISO6391.from_code(code)
        %{iso_639_1: "es" = code} -> assert "Spanish,Castilian" == ISO6391.from_code(code)
        %{iso_639_1: "ug" = code} -> assert "Uighur,Uyghur" == ISO6391.from_code(code)
        %{iso_639_1: "za" = code} -> assert "Chuang,Zhuang" == ISO6391.from_code(code)
        %{iso_639_1: code, name: name} -> assert name == ISO6391.from_code(code)
      end)
    end
  end

  describe "to_code/1" do
    test "get English code" do
      assert "en" = ISO6391.to_code("English")
    end

    test "get Nyanja languages code" do
      assert "ny" = ISO6391.to_code("Chichewa")
      assert "ny" = ISO6391.to_code("Chewa")
      assert "ny" = ISO6391.to_code("Nyanja")
    end

    test "non iso language" do
      assert ISO6391.to_code("Gibberish") |> is_nil()
    end

    test "all codes" do
      ISO6391.Codes.list()
      |> Enum.each(fn %{iso_639_1: code, name: name} ->
        assert code == ISO6391.to_code(name)
      end)
    end
  end
end
