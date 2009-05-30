module Blockd
  class BlockLiteralNode < Treetop::Runtime::SyntaxNode
    def value
      block_str = "Codeblock.new("

      ruby_params_string = "" # for ruby params list to block

      if params.respond_to?(:value)
        ruby_params_string += "|"
        names_and_identifiers = params.value

        param_names = []
        param_identifiers = []

        names_and_identifiers.each do |pair|
          if pair[:name]
            param_names << pair[:name].to_s
          else
            param_names << "nil"
          end

          if pair[:identifier]
            param_identifiers << pair[:identifier].to_s
          end
        end

        block_str += "[" + param_names.select{|p| p}.join(",") + "]"

        ruby_params_string += param_identifiers.join(",")
        ruby_params_string += "| "
      end


      block_str += "){"

      block_str += ruby_params_string

      block_str += body.value
      block_str += "}"
    end
  end
end
