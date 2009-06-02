module Blockd
  class MethodDefinitionNode < Treetop::Runtime::SyntaxNode
    def value
      if method_body.params.respond_to?(:value)
        "define_method(:#{method_name.value}, &#{method_body.value})"
      else
        # no parameters given -> simply call define_method with a param-less block
        "define_method(:#{method_name.value}){#{method_body.body.value}}"
      end
    end
  end
end
