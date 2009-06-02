module Blockd
  class ReturnNode < Treetop::Runtime::SyntaxNode
    def value
      "return #{ret_val.value}"
    end
  end
end
