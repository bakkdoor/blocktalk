module Blocktalk
  class MethodDefinitionNode < Treetop::Runtime::SyntaxNode
    include ASTHelpers::MethodDefinitions

    def value
      if method_body.params.respond_to?(:value)
        params_val = method_body.params.value
        param_names = params_val.collect{|p| p[:name].to_s[1..-1] if p[:name]}.reject{|p| p.nil?}

        method_name_val = ruby_method(method_name, method_body.params)

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
