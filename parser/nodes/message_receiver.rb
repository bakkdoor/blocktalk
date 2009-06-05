module Blocktalk
  class MessageReceiverNode < Treetop::Runtime::SyntaxNode
    def value
      puts "in messagereceivernode"
    end
  end
end
