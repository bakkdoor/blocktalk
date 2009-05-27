module Blockd
  class MessageWithParamsNode < Treetop::Runtime::SyntaxNode
    def value
#      Kernel::eval "#{receiver.value}.#{message.value} params.value.join(',')"
#      puts message.value
      { :message => message.value,
        :params => params.value}
    end
  end
end
