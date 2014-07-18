module ApplicationHelper
  def full_title(title)
    base_title = "Upanishad Knowledge Map"
    if title.empty?
       base_title
    else
       "#{title}"
    end
  end

end
