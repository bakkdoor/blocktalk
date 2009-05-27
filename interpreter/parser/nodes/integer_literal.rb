module Blockd
  class IntegerLiteralNode < Treetop::Runtime::SyntaxNode
    def eval
      self.text_value.to_i
    end
  end
end
