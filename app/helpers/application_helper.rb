module ApplicationHelper
  def title(page_title)
    content_for(:title) { "#{page_title} • Overboard" }
  end

  def parse(text)
    HTML::Pipeline::MarkdownFilter.new(text).call
  end
end
