module Blockd
  class MessageWithoutParamsNode < Treetop::Runtime::SyntaxNode
    def value
      puts "in messagewithoutparamsnode#value"
      puts
      puts message.text_value
    end
  end
end
