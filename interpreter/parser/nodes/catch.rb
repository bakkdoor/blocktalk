module Blockd
  class CatchNode < Treetop::Runtime::SyntaxNode
    def value
      if self.text_value.match(/catch\: \S+/)
        rescue_str = "rescue #{error_class.identifier.value}"

        # we have a block parameter
        if catch_block.params.text_value.match(/\|[\s\S]*\|/)
          block_param = catch_block.params.value.first
          rescue_str += " => #{block_param[:identifier]};"
        else
          rescue_str += ";"
        end

        rescue_str += "#{catch_block.body.value}"
        return rescue_str
      else
        return "rescue;#{catch_block.body.value}"
      end
    end
  end
end
