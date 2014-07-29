module ApplicationHelper
  def full_title(title)
    base_title = "Upanishad Knowledge Map"
    if title.empty?
       base_title
    else
       "#{title}"
    end
  end
  def to_devanagri_digit(digit)
    return "\u{0966}" if digit == 0
    return "\u{0967}" if digit == 1
    return "\u{0968}" if digit == 2
    return "\u{0969}" if digit == 3
    return "\u{096A}" if digit == 4
    return "\u{096B}" if digit == 5
    return "\u{096C}" if digit == 6
    return "\u{096D}" if digit == 7
    return "\u{096E}" if digit == 8
    return "\u{096F}" if digit == 9
  end

  def to_devanagri_number(number)
    digits = number.to_s.split('').map { |digit| to_devanagri_digit(digit.to_i) }
    digits.join
  end

  def to_sanskrit_id(chapter_num, section_num, verse_num)
    "\u{0965} #{to_devanagri_number(chapter_num)}:#{to_devanagri_number(section_num)}:#{to_devanagri_number(verse_num)} \u{0965}"
  end

  def to_english_id(chapter_num, section_num, verse_num)
    "|| #{chapter_num}:#{section_num}:#{verse_num} ||"
  end
end
