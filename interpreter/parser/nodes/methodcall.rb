module Blockd
  class MethodcallNode < Treetop::Runtime::SyntaxNode
    def value

      message_hash = message.value
      message = message_hash[:message]
      params = message_hash[:params].collect{|p| p.value}

      eval_str = "#{receiver.value}.#{message} "
      eval_str += "#{params.join(', ')}"
      Kernel::eval eval_str
    end
  end
end
