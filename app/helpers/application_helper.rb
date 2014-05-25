module ApplicationHelper
  def full_title(title)
    basic_title = "Tiles Challenge"

    return basic_title if title.empty?
    "#{basic_title} | #{title}"
  end
end
