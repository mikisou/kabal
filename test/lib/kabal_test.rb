require 'test_helper'

include Kabal

class KabalTest < TestCase
  def test_language_init
    Kabal.language = "Russian"
    assert_equal Kabal.current_language, "Russian"
  end

  def test_to_text
    assert_equal Kabal.to_text(125125125125), "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять"
  end

  def test_to_text_in_language
    assert_equal Kabal.to_text_in_language(125125125125, "Russian"), "сто двадцать пять миллиардов сто двадцать пять миллионов сто двадцать пять тысяч сто двадцать пять"
  end

  def test_to_text_in_language_with_unsupported_language
    #FIXME replace RuntimeError to NoLanguageSupportError
    exception = assert_raises RuntimeError do
      Kabal.to_text_in_language(125125125125, "Elfin")
    end
    assert_equal NoLanguageSupportError.message, exception.message
  end
end
