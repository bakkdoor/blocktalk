module Blocktalk
  class YieldNode < Treetop::Runtime::SyntaxNode
    def value
#       array_str =  yieldval.value
#       array_str = array_str[1..-1]
#       array_str = array_str[0..-2]

#       yieldparams = []
#       array_str.split(/\s*,\s*/).each do |elem|
#         yieldparams << elem
#       end
#      "yield(#{yieldparams.join(",")})"

      # not needed, as ArrayLiteralNode returns it correctly for now...
      "yield(#{yieldval.text_value})"
    end
  end
end
