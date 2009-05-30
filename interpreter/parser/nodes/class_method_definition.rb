module Blockd
  class ClassMethodDefinitionNode < Treetop::Runtime::SyntaxNode
    def value
      "define_method(\"self.#{method_name.value}\", &#{method_body.value})"
    end
  end
end
