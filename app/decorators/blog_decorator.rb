# frozen_string_literal: true

module BlogDecorator
  def blog_title
    title
  end

  def link
    link_to blog_title, edit_blog_path(self), class: "carender_lek_class"
  end

  def title_a
    if self.title.present?
      self.title
    end   
  end

  def content
    if content_1.present? || self.title.present?
      content_1
    end   
  end

  def content_a
    if self.content_2.present? || self.title.present?
      content_2
    end   
  end

  def content_b
    if self.content_3? || self.title.present?
      content_3
    end   
  end
  
end
