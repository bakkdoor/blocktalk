module Blockd
  class ExpressionNode < Treetop::Runtime::SyntaxNode
    def eval
      puts "in expressionnode#eval"
      self.subexpr.eval
    end
  end
end
