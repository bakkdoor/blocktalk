module Blockd
  module ParamValueNode# < Treetop::Runtime::SyntaxNode
    def value
#      Kernel::eval "#{receiver.value}.send(#{})"
#      puts message.value
#      puts params.value
#      puts "in paramvaluenode#value"
#      puts self.inspect
      self.text_value
    end
  end
end
