module Blocktalk
  class MethodDefinitionNode < Treetop::Runtime::SyntaxNode
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

        eval_str = ""

        # check for constructor definition
        # if we have a method called "initialize_*", we create the
        # initialize method (ruby constructor) and inside call the
        # defined method
        if method_name_val =~ /initialize_\S*/
          eval_str +=
            "define_method(:initialize){|first_val,#{param_names.join(',')}| self.#{method_name_val}(first_val,#{param_names.join(',')})};"
        end

        # now simply define the method
        eval_str += "define_method(:#{method_name_val}, &#{method_body.value})"
        return eval_str
      else
        # no parameters given -> simply call define_method with a param-less block
        "define_method(:#{method_name.value}){#{method_body.body.value}}"
      end
    end
  end
end
