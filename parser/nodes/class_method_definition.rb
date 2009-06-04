module Blockd
  class ClassMethodDefinitionNode < Treetop::Runtime::SyntaxNode
    def value
      if method_body.params.respond_to?(:value)
        params_val = method_body.params.value
        method_name_val = method_name.value
        param_names = params_val.collect{|p| p[:name].to_s[1..-1] if p[:name]}.reject{|p| p.nil?}

        # methods with more than one parameter have names including
        # the additional param-names, e.g.:
        # def goto = do |place with: vehicle| ... end
        # becomes: def goto_with(place, vehicle) ... end
        if param_names.size > 0
          method_name_val += "__" + param_names.join("__")
        end

        "self.meta_class.class_eval{define_method(:#{method_name_val}, &#{method_body.value})}"
      else
        # no parameters given -> simply call define_method with a param-less block
        "self.meta_class.class_eval{define_method(\"#{method_name.value}\", &#{method_body.bodyvalue})}"
      end
    end
  end
end
