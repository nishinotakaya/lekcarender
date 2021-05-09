# frozen_string_literal: true

require 'test_helper'

class ClientDecoratorTest < ActiveSupport::TestCase
  def setup
    @client = Client.new.extend ClientDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
