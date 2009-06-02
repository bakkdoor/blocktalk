module Blockd
  class IdentifierNode < Treetop::Runtime::SyntaxNode
    def value
      self.text_value
    end
  end
end
