module Blockd
  class StringLiteralNode < Treetop::Runtime::SyntaxNode
    def value
      "\"" + self.string_val.elements.collect{|e| e.value}.join("") + "\""
    end
  end
end
