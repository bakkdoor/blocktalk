module Blockd
  class ExpressionNode < Treetop::Runtime::SyntaxNode
    def value
      subexpr.elements[0].value
    end
  end
end
