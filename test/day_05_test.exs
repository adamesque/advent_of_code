defmodule AdventOfCode.DayFiveTest do
  use ExUnit.Case
  import AdventOfCode.DayFive

  test "nice strings?" do
    assert nice?("ugknbfddgicrmopn")
    assert nice?("aaa")
    refute nice?("jchzalrnumimnmhp")
    refute nice?("haegwjzuvuyypxyu")
    refute nice?("dvszwmarrgswjxmb")
  end

  test "vowel count" do
    assert vowel_count("abcde") == 2
  end

  test "has_pair?" do
    assert has_pair?("xyxy")
    assert has_pair?("aabcdefgaa")
    refute has_pair?("aaa")
  end

  test "has_sandwich?" do
    assert has_sandwich?("xyx")
    assert has_sandwich?("abcdefeghi")
    assert has_sandwich?("aaa")
    refute has_sandwich?("aa")
  end

  test "nicer?" do
    assert nicer?("qjhvhtzxzqqjkmpb")
    assert nicer?("xxyxx")
    refute nicer?("uurcxstgmygtbstg")
    refute nicer?("ieodomkazucvgmuy")
  end
end
