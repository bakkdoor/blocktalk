module Blockd
  class MethodcallNode < Treetop::Runtime::SyntaxNode
    def value
      message_hash = message.value
      message = message_hash[:message]
      params = message_hash[:params].collect{|p| p.value}

      eval_str = "#{receiver.value}.#{message}("
      eval_str += "#{params.join(', ')}"

      if passed_block.class == Blockd::BlockLiteralNode
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

      elsif passed_block.text_value =~ /&\S+/
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
