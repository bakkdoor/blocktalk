module Blockd
  class MethodcallNode < Treetop::Runtime::SyntaxNode
    def value
      message_hash = message.value
      message = message_hash[:message]
      params = message_hash[:params].collect{|p| p.value}

      eval_str = "#{receiver.value}.#{message}("
      eval_str += "#{params.join(', ')}"

      if passed_block.class == Blockd::BlockLiteralNode
        if params.size > 0
          eval_str += ", "
        end
        eval_str += "&" + passed_block.value
      elsif passed_block.text_value =~ /&\S+/
        # check for Proc-Objects passed to method as block
        if params.size > 0
          eval_str += ", "
        end
        eval_str += "&"
        eval_str += passed_block.block_var_name.value
      end

      eval_str += ")"

      return eval_str
    end
  end
end
