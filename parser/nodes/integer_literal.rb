module Blocktalk
  class IntegerLiteralNode < Treetop::Runtime::SyntaxNode
    def value
      self.text_value.to_i
    end
  end
end
