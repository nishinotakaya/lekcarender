# frozen_string_literal: true

require 'test_helper'

class ClientDecoratorTest < ActiveSupport::TestCase
  def setup
    @client = Client.new.extend ClientDecorator
  end

  def client_birthday
    if model.month == self.birthday.month && self.birthday.day > Date.today.day && client.birthday.month == Date.today.month || model.month == self.birthday.month && self.birthday.month > Date.today.month
      self.birthday
      self.birthday.strftime("%Je%Jg年%m月%d日") 【age_1_ago(client.birthday) 歳】
    end
  end
end
