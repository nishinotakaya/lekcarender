# frozen_string_literal: true

require 'test_helper'

class BlogDecoratorTest < ActiveSupport::TestCase
  def setup
    @blog = Blog.new.extend BlogDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
