# frozen_string_literal: true

module VariableTyping
  def type(string, speed = 'slow')
    speed = if speed == 'fast'
              0.03
            elsif speed == 'mid'
              0.05
            else 
              0.2
            end
      string.each_char do |c|
          sleep speed
          print c
      end
  end
end
