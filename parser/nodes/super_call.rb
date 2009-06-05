module Blocktalk
  class SuperCallNode < Treetop::Runtime::SyntaxNode
    def value
      params_str = ""
      if params.respond_to?(:value)
        # we've got some params!
        params_str = params.value.collect{|p| p[:value]}.join(",")
      end
      return "super(#{params_str})"
    end
  end
end
