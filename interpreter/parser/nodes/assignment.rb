module Blockd
  class AssignmentNode < Treetop::Runtime::SyntaxNode
    def value
      puts "in assignmentnode#value"
      Kernel::eval "#{target.value} = #{value.subexpr.value}"
    end
  end
end
