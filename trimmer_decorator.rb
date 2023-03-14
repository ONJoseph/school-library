require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    if suer.length > 10
      super[0...10]
    else
      super
    end
  end
end
