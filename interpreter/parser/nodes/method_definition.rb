module Blockd
  class MethodDefinitionNode < Treetop::Runtime::SyntaxNode
    def value
      "define_method(:#{method_name.value}, &#{method_body.value})"
    end
  end
end
