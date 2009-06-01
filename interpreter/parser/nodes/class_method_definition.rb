module Blockd
  class ClassMethodDefinitionNode < Treetop::Runtime::SyntaxNode
    def value
      "self.meta_class.class_eval{define_method(\"#{method_name.value}\", &#{method_body.value})}"
    end
  end
end
