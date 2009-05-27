module Blockd
  class RootNode < Treetop::Runtime::SyntaxNode
    def value
      self.exprs.elements.each{|expr| expr.elements[0].value }
    end
  end
end
