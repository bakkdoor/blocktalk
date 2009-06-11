module Blocktalk
  class StringLiteralNode < Treetop::Runtime::SyntaxNode
    def value
      "\"" + self.string_val.elements.collect{|e| e.value}.join("").gsub('"', '\"').gsub("'", "\'") + "\""
    end
  end
end
