module Blockd
  class BlockLiteralNode < Treetop::Runtime::SyntaxNode
    def value
      block_str = "Proc.new{"

      if params.respond_to?(:value)
        block_str += params.value
      end

      block_str += body.value
      block_str += "}"
    end
  end
end
