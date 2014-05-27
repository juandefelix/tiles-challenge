def full_title(page_title)
  base_title = "Tiles Challenge"
  return base_title if page_title.empty?
  "#{base_title} | #{page_title}"
end