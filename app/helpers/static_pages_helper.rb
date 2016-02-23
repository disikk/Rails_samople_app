module StaticPagesHelper
  def page_title(title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if title.empty? || title.blank?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
end
