module Blocktalk
  class ClassMethodDefinitionNode < Treetop::Runtime::SyntaxNode
    include ASTHelpers::MethodDefinitions

    def value
      if method_body.params.respond_to?(:value)
        method_name_with_params = ruby_method(method_name, method_body.params)
        "self.meta_class.class_eval{define_method(:#{method_name_with_params}, &#{method_body.value})}"
      else
        # no parameters given -> simply call define_method with a param-less block
        "self.meta_class.class_eval{define_method(\"#{method_name.value}\", &#{method_body.body.value})}"
      end
    end
  end
end
