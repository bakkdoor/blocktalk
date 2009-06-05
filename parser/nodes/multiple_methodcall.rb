module Blockd
  class MultipleMethodcallNode < Treetop::Runtime::SyntaxNode
    def value
      eval_str = ""
      receiver_val = receiver.value
      messages.elements.each do |m|
        message_hash = m.message.value
        message = message_hash[:message]
        param_names = message_hash[:params].collect{|p| p.is_a?(Hash) ? p[:name] : nil}
        param_values = message_hash[:params].collect{|p| p.is_a?(Hash) ? p[:value] : p.value}
        message += param_names.join("__")

        eval_str += "#{receiver_val}.#{message}("
        eval_str += "#{param_values.join(', ')}"
        eval_str += ");"
      end

      message_hash = final_message.value
      message = message_hash[:message]
      param_names = message_hash[:params].collect{|p| p.is_a?(Hash) ? p[:name] : nil}
      param_values = message_hash[:params].collect{|p| p.is_a?(Hash) ? p[:value] : p.value}
      message += param_names.join("__")

      eval_str += "#{receiver_val}.#{message}(#{param_values.join(', ')})"
      eval_str
    end
  end
end
