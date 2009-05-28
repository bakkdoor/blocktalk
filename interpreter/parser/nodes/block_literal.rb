module Blockd
  class BlockLiteralNode < Treetop::Runtime::SyntaxNode
    def value
      block_str = "Proc.new{"
      block_str += params.value
      block_str += body.value
      block_str += "}"
    end
  end
end
