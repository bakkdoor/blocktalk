module Blockd
  class MethodcallNode < Treetop::Runtime::SyntaxNode
    def value
      puts "in methodcallnode#value"
      puts
#      Kernel::eval "#{receiver.value}.send(#{})"
    end
  end
end
