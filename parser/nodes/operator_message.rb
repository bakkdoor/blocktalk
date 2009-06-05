module Blocktalk
  class OperatorMessageNode < Treetop::Runtime::SyntaxNode
    def value
      { :message => operator_name.value,
        :params => [param_value]}
    end
  end
end
