module Blocktalk
  class MethodcallNode < Treetop::Runtime::SyntaxNode
    include ASTHelpers::Methodcalls
    def value
      first_messagecall = ""

      if looks_like_block?(first_passed_block_with_ws)
        first_messagecall = generate_methodcall(receiver,
                                                first_message,
                                                first_passed_block_with_ws.passed_block)
      else
        first_messagecall = generate_methodcall(receiver, first_message)
      end

      chained_methodcalls = first_messagecall

      messages.elements.each do |whitespace_with_message|
        ws_w_msg = whitespace_with_message
        chained_methodcalls =
          if looks_like_block?(ws_w_msg.passed_block_with_ws)
            generate_methodcall(chained_methodcalls,
                                ws_w_msg.message,
                                ws_w_msg.passed_block_with_ws.passed_block)
          else
            generate_methodcall(chained_methodcalls,
                                ws_w_msg.message)
          end
      end

      chained_methodcalls
    end

    def looks_like_block?(node)
      node.text_value =~ /(\{|do)/
    end
  end
end
