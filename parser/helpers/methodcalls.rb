module Blocktalk
  module ASTHelpers
    module Methodcalls
      def generate_methodcall(receiver, message, passed_block = nil)
        message_hash = message.value
        message = message_hash[:message]
        param_names = message_hash[:params].collect{|p| p.is_a?(Hash) ? p[:name] : nil}
        param_values = message_hash[:params].collect{|p| p.is_a?(Hash) ? p[:value] : p.value}
        message += param_names.join("__")

        if message =~ /new_\S*/
          message = "new"
        end

        # this happens, when we pass in a chained method call
        # the string then is the already evaluated part of the chain...
        eval_str = ""
        if receiver.is_a?(String)
          eval_str += "#{receiver}.#{message}("
        else
          eval_str += "#{receiver.value}.#{message}("
        end
        eval_str += "#{param_values.join(', ')}"

        if passed_block && passed_block.class == Blocktalk::BlockLiteralNode
          eval_str += "){" # start block

          # check for block_params
          if passed_block.params.respond_to?(:value)
            eval_str += "|"
            eval_str +=
              passed_block.params.value.collect{|p| p[:identifier]}.join(",")
            eval_str += "| "
          end

          eval_str += passed_block.body.value # insert block-body
          eval_str += "}" # end block

        elsif passed_block && passed_block.text_value =~ /&\S+/
          # check for Proc-Objects passed to method as block
          if params.size > 0
            eval_str += ", "
          end
          eval_str += "&"
          eval_str += passed_block.block_var_name.value
          eval_str += ")"
        else
          # no block given -> method call is finished
          eval_str += ")"
        end

        return eval_str
      end
    end
  end
end
