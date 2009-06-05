module Blocktalk
  class RootNode < Treetop::Runtime::SyntaxNode
    def evaluate
      self.value
    end

    def value
      self.exprs.elements.each do |e|
        if e.elements[0].respond_to?(:value)
          Evaluator.add e.elements[0].value
        end
      end
    end
  end
end
