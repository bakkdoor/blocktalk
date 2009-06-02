module Blockd
  class MessageWithoutParamsNode < Treetop::Runtime::SyntaxNode
    def value
      {
        :message => message.value,
        :params => []
      }
    end
  end
end
