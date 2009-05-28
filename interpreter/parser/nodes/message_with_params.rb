module Blockd
  class MessageWithParamsNode < Treetop::Runtime::SyntaxNode
    def value
      { :message => message.value,
        :params => params.value}
    end
  end
end
