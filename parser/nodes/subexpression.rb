module Blocktalk
  class SubexpressionNode < Treetop::Runtime::SyntaxNode
    def value
      subexpr.value
    end
  end
end
