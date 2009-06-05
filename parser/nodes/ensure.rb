module Blocktalk
  class EnsureNode < Treetop::Runtime::SyntaxNode
    def value
      "ensure; #{ensure_block.body.value}"
    end
  end
end
