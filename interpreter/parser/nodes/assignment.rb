module Blockd
  class AssignmentNode < Treetop::Runtime::SyntaxNode
    def eval
      STDERR.puts "=================> assignment: #{target.textvalue}  = #{value.textvalue}"
    end
  end
end
