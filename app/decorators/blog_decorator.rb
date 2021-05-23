# frozen_string_literal: true

module BlogDecorator
  def blog_title
    title
  end

  def link
    link_to blog_title, edit_blog_path(self), class: "carender_lek_class" 
  end

  def blog_content_all
  end
end
