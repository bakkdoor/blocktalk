module Blockd
  class TryNode < Treetop::Runtime::SyntaxNode
    def value
      "begin; #{try_block.body.value}; end;"
    end
  end
end
