# frozen_string_literal: true

class Choice
  attr_reader :text, :description, :value

  def initialize(text, description, value)
    @text = text
    @description = description
    @value = value
  end
end
