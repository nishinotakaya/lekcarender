# frozen_string_literal: true

module BlogDecorator
  def blog_title
    title
  end

  def link
    link_to title, edit_blog_path(blog)
  end
end
