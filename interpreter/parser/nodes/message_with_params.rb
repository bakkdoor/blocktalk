module Blockd
  class MessageWithParamsNode < Treetop::Runtime::SyntaxNode
    def value
      { :message => message.value,
        :params => params}
    end
  end
end
