require 'minitest/autorun'
require 'stringio'

class TestStringCalculator < Minitest::Test
  def test_add_empty_string
    assert_equal 0, StringCalculator.add("")
  end

  def test_add_single_number
    assert_equal 1, StringCalculator.add("1")
  end

  def test_add_two_numbers
    assert_equal 6, StringCalculator.add("1,5")
  end

  def test_add_multiple_numbers
    assert_equal 10, StringCalculator.add("1,2,3,4")
  end

  def test_add_with_newlines
    assert_equal 6, StringCalculator.add("1\n2,3")
  end

  def test_add_with_custom_delimiter
    assert_equal 3, StringCalculator.add("//;\n1;2")
  end

  def test_add_with_negative_number
    exception = assert_raises(RuntimeError) { StringCalculator.add("1,-2,3") }
    assert_equal "negative numbers not allowed: -2", exception.message
  end

  def test_add_with_multiple_negative_numbers
    exception = assert_raises(RuntimeError) { StringCalculator.add("1,-2,-3,4") }
    assert_equal "negative numbers not allowed: -2, -3", exception.message
  end

  def test_add_with_different_custom_delimiter
    assert_equal 6, StringCalculator.add("//|\n1|2|3")
  end
end
