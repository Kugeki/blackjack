# frozen_string_literal: true

class Choice
  attr_reader :text, :description, :value
  attr_accessor :active

  def initialize(text, description, value, active: true)
    @text = text
    @description = description
    @value = value
    @active = active
  end

  def active?
    active
  end
end
