module Blocktalk
  module ASTHelpers
    module MethodDefinitions
      def ruby_method(method_name, params)
        params_val = params.value
        method_name_val = method_name.value

        bang_or_question = nil

        # check for bang or boolean methods (!/? at the end)
        if method_name.text_value =~ /(!|\?)/
          method_name_val = method_name_val[0..-2]
          bang_or_question = method_name.text_value[-1].chr.to_s
        end

        param_names = params_val.collect{|p| p[:name].to_s[1..-1] if p[:name]}.reject{|p| p.nil?}
        # methods with more than one parameter have names including
        # the additional param-names, e.g.:
        # def goto = do |place with: vehicle| ... end
        # becomes: def goto_with(place, vehicle) ... end
        if param_names.size > 0
          method_name_val += "__" + param_names.join("__")
        end

        method_name_val += bang_or_question if bang_or_question

        return method_name_val
      end
    end
  end
end
