module Blockd
  include Treetop::Runtime

  def root
    @root || :blockd_programm
  end

  module BlockdProgramm0
    def exprs
      elements[1]
    end

  end

  def _nt_blockd_programm
    start_index = index
    if node_cache[:blockd_programm].has_key?(index)
      cached = node_cache[:blockd_programm][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      r2 = _nt_ws
      if r2
        s1 << r2
      else
        break
      end
    end
    r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        r4 = _nt_expression
        if r4
          s3 << r4
        else
          break
        end
      end
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s0 << r3
      if r3
        s5, i5 = [], index
        loop do
          r6 = _nt_ws
          if r6
            s5 << r6
          else
            break
          end
        end
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(RootNode,input, i0...index, s0)
      r0.extend(BlockdProgramm0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:blockd_programm][start_index] = r0

    return r0
  end

  module Comment0
  end

  module Comment1
  end

  def _nt_comment
    start_index = index
    if node_cache[:comment].has_key?(index)
      cached = node_cache[:comment][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('#', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('#')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        i4 = index
        if input.index(Regexp.new('[\\n]'), index) == index
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r5 = nil
        end
        if r5
          r4 = nil
        else
          self.index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s3 << r4
        if r4
          if index < input_length
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("any character")
            r6 = nil
          end
          s3 << r6
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Comment0)
        else
          self.index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        if input.index(Regexp.new('[\\n]'), index) == index
          r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r8 = nil
        end
        if r8
          r7 = r8
        else
          r7 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r7
      end
    end
    if s0.last
      r0 = instantiate_node(CommentNode,input, i0...index, s0)
      r0.extend(Comment1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:comment][start_index] = r0

    return r0
  end

  module Expression0
  end

  module Expression1
    def subexpr
      elements[0]
    end

  end

  def _nt_expression
    start_index = index
    if node_cache[:expression].has_key?(index)
      cached = node_cache[:expression][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_method_definition
    if r2
      r1 = r2
    else
      r3 = _nt_return_statement
      if r3
        r1 = r3
      else
        r4 = _nt_yield_statement
        if r4
          r1 = r4
        else
          r5 = _nt_try_expression
          if r5
            r1 = r5
          else
            r6 = _nt_catch_expression
            if r6
              r1 = r6
            else
              r7 = _nt_ensure_expression
              if r7
                r1 = r7
              else
                r8 = _nt_method_call
                if r8
                  r1 = r8
                else
                  r9 = _nt_assignment
                  if r9
                    r1 = r9
                  else
                    r10 = _nt_literal
                    if r10
                      r1 = r10
                    else
                      r11 = _nt_subexpression
                      if r11
                        r1 = r11
                      else
                        r12 = _nt_comment
                        if r12
                          r1 = r12
                        else
                          self.index = i1
                          r1 = nil
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    s0 << r1
    if r1
      i13 = index
      if input.index('$', index) == index
        r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('$')
        r14 = nil
      end
      if r14
        r13 = r14
      else
        i15, s15 = index, []
        s16, i16 = [], index
        loop do
          r17 = _nt_ws
          if r17
            s16 << r17
          else
            break
          end
        end
        r16 = instantiate_node(SyntaxNode,input, i16...index, s16)
        s15 << r16
        if r16
          r19 = _nt_newline
          if r19
            r18 = r19
          else
            r18 = instantiate_node(SyntaxNode,input, index...index)
          end
          s15 << r18
        end
        if s15.last
          r15 = instantiate_node(SyntaxNode,input, i15...index, s15)
          r15.extend(Expression0)
        else
          self.index = i15
          r15 = nil
        end
        if r15
          r13 = r15
        else
          self.index = i13
          r13 = nil
        end
      end
      s0 << r13
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Expression1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:expression][start_index] = r0

    return r0
  end

  module MethodDefinition0
    def method_name
      elements[3]
    end

    def method_body
      elements[7]
    end
  end

  module MethodDefinition1
    def method_name
      elements[4]
    end

    def method_body
      elements[8]
    end
  end

  def _nt_method_definition
    start_index = index
    if node_cache[:method_definition].has_key?(index)
      cached = node_cache[:method_definition][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    s2, i2 = [], index
    loop do
      r3 = _nt_spaces
      if r3
        s2 << r3
      else
        break
      end
    end
    r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
    s1 << r2
    if r2
      if input.index('def', index) == index
        r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure('def')
        r4 = nil
      end
      s1 << r4
      if r4
        s5, i5 = [], index
        loop do
          r6 = _nt_spaces
          if r6
            s5 << r6
          else
            break
          end
        end
        if s5.empty?
          self.index = i5
          r5 = nil
        else
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        end
        s1 << r5
        if r5
          r7 = _nt_message_name
          s1 << r7
          if r7
            s8, i8 = [], index
            loop do
              r9 = _nt_ws
              if r9
                s8 << r9
              else
                break
              end
            end
            r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
            s1 << r8
            if r8
              if input.index('=', index) == index
                r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure('=')
                r10 = nil
              end
              s1 << r10
              if r10
                s11, i11 = [], index
                loop do
                  r12 = _nt_ws
                  if r12
                    s11 << r12
                  else
                    break
                  end
                end
                r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
                s1 << r11
                if r11
                  r13 = _nt_block_literal
                  s1 << r13
                end
              end
            end
          end
        end
      end
    end
    if s1.last
      r1 = instantiate_node(MethodDefinitionNode,input, i1...index, s1)
      r1.extend(MethodDefinition0)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i14, s14 = index, []
      s15, i15 = [], index
      loop do
        r16 = _nt_spaces
        if r16
          s15 << r16
        else
          break
        end
      end
      r15 = instantiate_node(SyntaxNode,input, i15...index, s15)
      s14 << r15
      if r15
        if input.index('def', index) == index
          r17 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure('def')
          r17 = nil
        end
        s14 << r17
        if r17
          s18, i18 = [], index
          loop do
            r19 = _nt_spaces
            if r19
              s18 << r19
            else
              break
            end
          end
          if s18.empty?
            self.index = i18
            r18 = nil
          else
            r18 = instantiate_node(SyntaxNode,input, i18...index, s18)
          end
          s14 << r18
          if r18
            if input.index('self ', index) == index
              r20 = instantiate_node(SyntaxNode,input, index...(index + 5))
              @index += 5
            else
              terminal_parse_failure('self ')
              r20 = nil
            end
            s14 << r20
            if r20
              r21 = _nt_message_name
              s14 << r21
              if r21
                s22, i22 = [], index
                loop do
                  r23 = _nt_ws
                  if r23
                    s22 << r23
                  else
                    break
                  end
                end
                r22 = instantiate_node(SyntaxNode,input, i22...index, s22)
                s14 << r22
                if r22
                  if input.index('=', index) == index
                    r24 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure('=')
                    r24 = nil
                  end
                  s14 << r24
                  if r24
                    s25, i25 = [], index
                    loop do
                      r26 = _nt_ws
                      if r26
                        s25 << r26
                      else
                        break
                      end
                    end
                    r25 = instantiate_node(SyntaxNode,input, i25...index, s25)
                    s14 << r25
                    if r25
                      r27 = _nt_block_literal
                      s14 << r27
                    end
                  end
                end
              end
            end
          end
        end
      end
      if s14.last
        r14 = instantiate_node(ClassMethodDefinitionNode,input, i14...index, s14)
        r14.extend(MethodDefinition1)
      else
        self.index = i14
        r14 = nil
      end
      if r14
        r0 = r14
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:method_definition][start_index] = r0

    return r0
  end

  module ReturnStatement0
    def ret_val
      elements[3]
    end
  end

  def _nt_return_statement
    start_index = index
    if node_cache[:return_statement].has_key?(index)
      cached = node_cache[:return_statement][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('return', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 6))
      @index += 6
    else
      terminal_parse_failure('return')
      r1 = nil
    end
    s0 << r1
    if r1
      if input.index(':', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(':')
        r3 = nil
      end
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
      if r2
        if input.index(' ', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(' ')
          r4 = nil
        end
        s0 << r4
        if r4
          i5 = index
          r6 = _nt_subexpression
          if r6
            r5 = r6
          else
            r7 = _nt_identifier
            if r7
              r5 = r7
            else
              r8 = _nt_literal
              if r8
                r5 = r8
              else
                self.index = i5
                r5 = nil
              end
            end
          end
          s0 << r5
        end
      end
    end
    if s0.last
      r0 = instantiate_node(ReturnNode,input, i0...index, s0)
      r0.extend(ReturnStatement0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:return_statement][start_index] = r0

    return r0
  end

  module YieldStatement0
    def yieldval
      elements[3]
    end
  end

  def _nt_yield_statement
    start_index = index
    if node_cache[:yield_statement].has_key?(index)
      cached = node_cache[:yield_statement][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('yield', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 5))
      @index += 5
    else
      terminal_parse_failure('yield')
      r1 = nil
    end
    s0 << r1
    if r1
      if input.index(':', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(':')
        r3 = nil
      end
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
      if r2
        if input.index(' ', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(' ')
          r4 = nil
        end
        s0 << r4
        if r4
          r5 = _nt_array_literal
          s0 << r5
        end
      end
    end
    if s0.last
      r0 = instantiate_node(YieldNode,input, i0...index, s0)
      r0.extend(YieldStatement0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:yield_statement][start_index] = r0

    return r0
  end

  module TryExpression0
    def try_block
      elements[2]
    end
  end

  def _nt_try_expression
    start_index = index
    if node_cache[:try_expression].has_key?(index)
      cached = node_cache[:try_expression][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('try', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('try')
      r1 = nil
    end
    s0 << r1
    if r1
      if input.index(' ', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(' ')
        r3 = nil
      end
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
      if r2
        r4 = _nt_block_literal
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(TryNode,input, i0...index, s0)
      r0.extend(TryExpression0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:try_expression][start_index] = r0

    return r0
  end

  module CatchExpression0
    def identifier
      elements[1]
    end

  end

  module CatchExpression1
    def error_class
      elements[1]
    end

    def catch_block
      elements[3]
    end
  end

  def _nt_catch_expression
    start_index = index
    if node_cache[:catch_expression].has_key?(index)
      cached = node_cache[:catch_expression][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('catch', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 5))
      @index += 5
    else
      terminal_parse_failure('catch')
      r1 = nil
    end
    s0 << r1
    if r1
      i3, s3 = index, []
      if input.index(': ', index) == index
        r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure(': ')
        r4 = nil
      end
      s3 << r4
      if r4
        r5 = _nt_identifier
        s3 << r5
        if r5
          if input.index(' ', index) == index
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(' ')
            r6 = nil
          end
          s3 << r6
        end
      end
      if s3.last
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        r3.extend(CatchExpression0)
      else
        self.index = i3
        r3 = nil
      end
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
      if r2
        if input.index(' ', index) == index
          r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(' ')
          r8 = nil
        end
        if r8
          r7 = r8
        else
          r7 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r7
        if r7
          r9 = _nt_block_literal
          s0 << r9
        end
      end
    end
    if s0.last
      r0 = instantiate_node(CatchNode,input, i0...index, s0)
      r0.extend(CatchExpression1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:catch_expression][start_index] = r0

    return r0
  end

  module EnsureExpression0
    def ensure_block
      elements[2]
    end
  end

  def _nt_ensure_expression
    start_index = index
    if node_cache[:ensure_expression].has_key?(index)
      cached = node_cache[:ensure_expression][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('ensure', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 6))
      @index += 6
    else
      terminal_parse_failure('ensure')
      r1 = nil
    end
    s0 << r1
    if r1
      if input.index(' ', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(' ')
        r3 = nil
      end
      if r3
        r2 = r3
      else
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
      if r2
        r4 = _nt_block_literal
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(EnsureNode,input, i0...index, s0)
      r0.extend(EnsureExpression0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:ensure_expression][start_index] = r0

    return r0
  end

  module Subexpression0
    def subexpr
      elements[2]
    end

  end

  def _nt_subexpression
    start_index = index
    if node_cache[:subexpression].has_key?(index)
      cached = node_cache[:subexpression][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('(', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_ws
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        r4 = _nt_expression
        s0 << r4
        if r4
          s5, i5 = [], index
          loop do
            r6 = _nt_ws
            if r6
              s5 << r6
            else
              break
            end
          end
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          s0 << r5
          if r5
            if input.index(')', index) == index
              r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(')')
              r7 = nil
            end
            s0 << r7
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(ExpressionNode,input, i0...index, s0)
      r0.extend(Subexpression0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:subexpression][start_index] = r0

    return r0
  end

  module Assignment0
    def target
      elements[0]
    end

    def val
      elements[4]
    end
  end

  module Assignment1
    def value
      if val.respond_to?(:subexpr)
        "#{target.value} = #{val.subexpr.value}"
      else
        "#{target.value} = #{val.value}"
      end
    end
  end

  def _nt_assignment
    start_index = index
    if node_cache[:assignment].has_key?(index)
      cached = node_cache[:assignment][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_identifier
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_ws
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        if input.index('=', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('=')
          r4 = nil
        end
        s0 << r4
        if r4
          s5, i5 = [], index
          loop do
            r6 = _nt_ws
            if r6
              s5 << r6
            else
              break
            end
          end
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          s0 << r5
          if r5
            i7 = index
            r8 = _nt_expression
            if r8
              r7 = r8
            else
              r9 = _nt_identifier
              if r9
                r7 = r9
              else
                r10 = _nt_literal
                if r10
                  r7 = r10
                else
                  self.index = i7
                  r7 = nil
                end
              end
            end
            s0 << r7
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Assignment0)
      r0.extend(Assignment1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:assignment][start_index] = r0

    return r0
  end

  module MethodCall0
    def block_var_name
      elements[1]
    end
  end

  module MethodCall1
    def receiver
      elements[0]
    end

    def message
      elements[2]
    end

    def passed_block
      elements[4]
    end
  end

  def _nt_method_call
    start_index = index
    if node_cache[:method_call].has_key?(index)
      cached = node_cache[:method_call][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_message_receiver
    s0 << r1
    if r1
      if input.index(' ', index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(' ')
        r2 = nil
      end
      s0 << r2
      if r2
        i3 = index
        r4 = _nt_operator_message
        if r4
          r3 = r4
        else
          r5 = _nt_message_with_params
          if r5
            r3 = r5
          else
            r6 = _nt_message_without_params
            if r6
              r3 = r6
            else
              self.index = i3
              r3 = nil
            end
          end
        end
        s0 << r3
        if r3
          if input.index(' ', index) == index
            r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(' ')
            r8 = nil
          end
          if r8
            r7 = r8
          else
            r7 = instantiate_node(SyntaxNode,input, index...index)
          end
          s0 << r7
          if r7
            i10 = index
            r11 = _nt_block_literal_do_end
            if r11
              r10 = r11
            else
              r12 = _nt_block_literal_curly_braces
              if r12
                r10 = r12
              else
                i13, s13 = index, []
                if input.index('&', index) == index
                  r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure('&')
                  r14 = nil
                end
                s13 << r14
                if r14
                  r15 = _nt_identifier
                  s13 << r15
                end
                if s13.last
                  r13 = instantiate_node(SyntaxNode,input, i13...index, s13)
                  r13.extend(MethodCall0)
                else
                  self.index = i13
                  r13 = nil
                end
                if r13
                  r10 = r13
                else
                  self.index = i10
                  r10 = nil
                end
              end
            end
            if r10
              r9 = r10
            else
              r9 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r9
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(MethodcallNode,input, i0...index, s0)
      r0.extend(MethodCall1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:method_call][start_index] = r0

    return r0
  end

  def _nt_message_receiver
    start_index = index
    if node_cache[:message_receiver].has_key?(index)
      cached = node_cache[:message_receiver][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1 = index
    r2 = _nt_literal
    if r2
      r1 = r2
    else
      r3 = _nt_identifier
      if r3
        r1 = r3
      else
        self.index = i1
        r1 = nil
      end
    end
    if r1
      r0 = r1
    else
      r4 = _nt_subexpression
      if r4
        r0 = r4
      else
        r5 = _nt_message_without_params
        if r5
          r0 = r5
        else
          self.index = i0
          r0 = nil
        end
      end
    end

    node_cache[:message_receiver][start_index] = r0

    return r0
  end

  module MessageWithParams0
    def message
      elements[0]
    end

    def params
      elements[1]
    end
  end

  def _nt_message_with_params
    start_index = index
    if node_cache[:message_with_params].has_key?(index)
      cached = node_cache[:message_with_params][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_message_name
    s0 << r1
    if r1
      r2 = _nt_message_params
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(MessageWithParamsNode,input, i0...index, s0)
      r0.extend(MessageWithParams0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:message_with_params][start_index] = r0

    return r0
  end

  module MessageWithoutParams0
    def message
      elements[0]
    end

  end

  def _nt_message_without_params
    start_index = index
    if node_cache[:message_without_params].has_key?(index)
      cached = node_cache[:message_without_params][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_message_name
    s0 << r1
    if r1
      i2 = index
      r3 = _nt_message_params
      if r3
        r2 = nil
      else
        self.index = i2
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(MessageWithoutParamsNode,input, i0...index, s0)
      r0.extend(MessageWithoutParams0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:message_without_params][start_index] = r0

    return r0
  end

  module OperatorMessage0
    def operator_name
      elements[0]
    end

    def param_value
      elements[2]
    end

  end

  def _nt_operator_message
    start_index = index
    if node_cache[:operator_message].has_key?(index)
      cached = node_cache[:operator_message][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_operator
    s0 << r1
    if r1
      if input.index(' ', index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(' ')
        r2 = nil
      end
      s0 << r2
      if r2
        r3 = _nt_param_value
        s0 << r3
        if r3
          i4 = index
          r5 = _nt_message_params
          if r5
            r4 = nil
          else
            self.index = i4
            r4 = instantiate_node(SyntaxNode,input, index...index)
          end
          s0 << r4
        end
      end
    end
    if s0.last
      r0 = instantiate_node(OperatorMessageNode,input, i0...index, s0)
      r0.extend(OperatorMessage0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:operator_message][start_index] = r0

    return r0
  end

  module MessageParams0
    def parameter
      elements[1]
    end
  end

  module MessageParams1
    def first_param
      elements[0]
    end

    def rest_params
      elements[1]
    end
  end

  module MessageParams2
    def value
      [first_param.value] + rest_params.elements.map do |space_and_param|
        space_and_param.parameter.value
      end
    end
  end

  def _nt_message_params
    start_index = index
    if node_cache[:message_params].has_key?(index)
      cached = node_cache[:message_params][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_first_param
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        if input.index(' ', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(' ')
          r4 = nil
        end
        s3 << r4
        if r4
          r5 = _nt_param
          s3 << r5
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(MessageParams0)
        else
          self.index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(MessageParams1)
      r0.extend(MessageParams2)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:message_params][start_index] = r0

    return r0
  end

  module FirstParam0
    def first_param_value
      elements[2]
    end
  end

  module FirstParam1
    def value
      first_param_value
    end
  end

  def _nt_first_param
    start_index = index
    if node_cache[:first_param].has_key?(index)
      cached = node_cache[:first_param][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(':', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure(':')
      r1 = nil
    end
    s0 << r1
    if r1
      if input.index(' ', index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(' ')
        r2 = nil
      end
      s0 << r2
      if r2
        r3 = _nt_param_value
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(FirstParam0)
      r0.extend(FirstParam1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:first_param][start_index] = r0

    return r0
  end

  module Param0
    def param_name
      elements[0]
    end

    def param_value
      elements[2]
    end
  end

  module Param1
    def value
      #[param_name.value, param_value.value]
      param_value
    end
  end

  def _nt_param
    start_index = index
    if node_cache[:param].has_key?(index)
      cached = node_cache[:param][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_param_name
    s0 << r1
    if r1
      if input.index(' ', index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(' ')
        r2 = nil
      end
      s0 << r2
      if r2
        r3 = _nt_param_value
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Param0)
      r0.extend(Param1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:param][start_index] = r0

    return r0
  end

  module ParamName0
    def identifier
      elements[0]
    end

  end

  module ParamName1
    def value
      identifier.value
    end
  end

  def _nt_param_name
    start_index = index
    if node_cache[:param_name].has_key?(index)
      cached = node_cache[:param_name][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_identifier
    s0 << r1
    if r1
      if input.index(':', index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(':')
        r2 = nil
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ParamName0)
      r0.extend(ParamName1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:param_name][start_index] = r0

    return r0
  end

  def _nt_param_value
    start_index = index
    if node_cache[:param_value].has_key?(index)
      cached = node_cache[:param_value][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_literal
    if r1
      r0 = r1
    else
      r2 = _nt_identifier
      if r2
        r0 = r2
      else
        r3 = _nt_subexpression
        if r3
          r0 = r3
        else
          self.index = i0
          r0 = nil
        end
      end
    end

    node_cache[:param_value][start_index] = r0

    return r0
  end

  def _nt_literal
    start_index = index
    if node_cache[:literal].has_key?(index)
      cached = node_cache[:literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_string_literal
    if r1
      r0 = r1
    else
      r2 = _nt_symbol_literal
      if r2
        r0 = r2
      else
        r3 = _nt_float_literal
        if r3
          r0 = r3
        else
          r4 = _nt_int_literal
          if r4
            r0 = r4
          else
            r5 = _nt_char_literal
            if r5
              r0 = r5
            else
              r6 = _nt_array_literal
              if r6
                r0 = r6
              else
                r7 = _nt_hash_literal
                if r7
                  r0 = r7
                else
                  r8 = _nt_block_literal
                  if r8
                    r0 = r8
                  else
                    r9 = _nt_regex_literal
                    if r9
                      r0 = r9
                    else
                      self.index = i0
                      r0 = nil
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:literal][start_index] = r0

    return r0
  end

  module StringLiteral0
    def string_val
      elements[1]
    end

  end

  module StringLiteral1
    def string_val
      elements[1]
    end

  end

  def _nt_string_literal
    start_index = index
    if node_cache[:string_literal].has_key?(index)
      cached = node_cache[:string_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if input.index('"', index) == index
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('"')
      r2 = nil
    end
    s1 << r2
    if r2
      s3, i3 = [], index
      loop do
        i4 = index
        r5 = _nt_string_interpolation
        if r5
          r4 = r5
        else
          r6 = _nt_string_char
          if r6
            r4 = r6
          else
            self.index = i4
            r4 = nil
          end
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s1 << r3
      if r3
        if input.index('"', index) == index
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('"')
          r7 = nil
        end
        s1 << r7
      end
    end
    if s1.last
      r1 = instantiate_node(StringLiteralNode,input, i1...index, s1)
      r1.extend(StringLiteral0)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i8, s8 = index, []
      if input.index("'", index) == index
        r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("'")
        r9 = nil
      end
      s8 << r9
      if r9
        s10, i10 = [], index
        loop do
          i11 = index
          r12 = _nt_string_interpolation
          if r12
            r11 = r12
          else
            r13 = _nt_string_char_single_quote
            if r13
              r11 = r13
            else
              self.index = i11
              r11 = nil
            end
          end
          if r11
            s10 << r11
          else
            break
          end
        end
        r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
        s8 << r10
        if r10
          if input.index("'", index) == index
            r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("'")
            r14 = nil
          end
          s8 << r14
        end
      end
      if s8.last
        r8 = instantiate_node(StringLiteralNode,input, i8...index, s8)
        r8.extend(StringLiteral1)
      else
        self.index = i8
        r8 = nil
      end
      if r8
        r0 = r8
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:string_literal][start_index] = r0

    return r0
  end

  module StringChar0
    def char
      elements[1]
    end
  end

  module StringChar1
    def value
      self.char.text_value
    end
  end

  def _nt_string_char
    start_index = index
    if node_cache[:string_char].has_key?(index)
      cached = node_cache[:string_char][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    if input.index('"', index) == index
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('"')
      r2 = nil
    end
    if r2
      r1 = nil
    else
      self.index = i1
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      if index < input_length
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("any character")
        r3 = nil
      end
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(StringChar0)
      r0.extend(StringChar1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:string_char][start_index] = r0

    return r0
  end

  module StringCharSingleQuote0
    def char
      elements[1]
    end
  end

  module StringCharSingleQuote1
    def value
      self.char.text_value
    end
  end

  def _nt_string_char_single_quote
    start_index = index
    if node_cache[:string_char_single_quote].has_key?(index)
      cached = node_cache[:string_char_single_quote][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    if input.index("'", index) == index
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("'")
      r2 = nil
    end
    if r2
      r1 = nil
    else
      self.index = i1
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      if index < input_length
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("any character")
        r3 = nil
      end
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(StringCharSingleQuote0)
      r0.extend(StringCharSingleQuote1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:string_char_single_quote][start_index] = r0

    return r0
  end

  module StringInterpolation0
    def expr
      elements[2]
    end

  end

  module StringInterpolation1
    def value
      val = "\#\{"
      val += expr.respond_to?(:value) ? expr.value : expr.subexpr.value
      val += "\}"
    end
  end

  def _nt_string_interpolation
    start_index = index
    if node_cache[:string_interpolation].has_key?(index)
      cached = node_cache[:string_interpolation][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('#{', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('#{')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_spaces
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        i4 = index
        r5 = _nt_expression
        if r5
          r4 = r5
        else
          r6 = _nt_identifier
          if r6
            r4 = r6
          else
            r7 = _nt_literal
            if r7
              r4 = r7
            else
              self.index = i4
              r4 = nil
            end
          end
        end
        s0 << r4
        if r4
          s8, i8 = [], index
          loop do
            r9 = _nt_spaces
            if r9
              s8 << r9
            else
              break
            end
          end
          r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
          s0 << r8
          if r8
            if input.index('}', index) == index
              r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('}')
              r10 = nil
            end
            s0 << r10
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(StringInterpolation0)
      r0.extend(StringInterpolation1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:string_interpolation][start_index] = r0

    return r0
  end

  module SymbolLiteral0
    def identifier
      elements[1]
    end
  end

  module SymbolLiteral1
    def symbol_name
      elements[1]
    end
  end

  module SymbolLiteral2
    def value
      (':' + symbol_name.text_value).to_sym
    end
  end

  def _nt_symbol_literal
    start_index = index
    if node_cache[:symbol_literal].has_key?(index)
      cached = node_cache[:symbol_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(':', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure(':')
      r1 = nil
    end
    s0 << r1
    if r1
      i2, s2 = index, []
      i3 = index
      if input.index(':', index) == index
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(':')
        r4 = nil
      end
      if r4
        r3 = nil
      else
        self.index = i3
        r3 = instantiate_node(SyntaxNode,input, index...index)
      end
      s2 << r3
      if r3
        r5 = _nt_identifier
        s2 << r5
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(SymbolLiteral0)
      else
        self.index = i2
        r2 = nil
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(SymbolLiteral1)
      r0.extend(SymbolLiteral2)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:symbol_literal][start_index] = r0

    return r0
  end

  module IntLiteral0
    def non_zero_digit
      elements[1]
    end

  end

  def _nt_int_literal
    start_index = index
    if node_cache[:int_literal].has_key?(index)
      cached = node_cache[:int_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r3 = _nt_sign
    if r3
      r2 = r3
    else
      r2 = instantiate_node(SyntaxNode,input, index...index)
    end
    s1 << r2
    if r2
      r4 = _nt_non_zero_digit
      s1 << r4
      if r4
        s5, i5 = [], index
        loop do
          r6 = _nt_digit
          if r6
            s5 << r6
          else
            break
          end
        end
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        s1 << r5
      end
    end
    if s1.last
      r1 = instantiate_node(IntegerLiteralNode,input, i1...index, s1)
      r1.extend(IntLiteral0)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if input.index(Regexp.new('[0]'), index) == index
        r7 = instantiate_node(IntegerLiteralNode,input, index...(index + 1))
        @index += 1
      else
        r7 = nil
      end
      if r7
        r0 = r7
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:int_literal][start_index] = r0

    return r0
  end

  module FloatLiteral0
  end

  module FloatLiteral1
    def value
      self.text_value.to_f
    end
  end

  def _nt_float_literal
    start_index = index
    if node_cache[:float_literal].has_key?(index)
      cached = node_cache[:float_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r2 = _nt_sign
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        r4 = _nt_digit
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        self.index = i3
        r3 = nil
      else
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      end
      s0 << r3
      if r3
        if input.index('.', index) == index
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('.')
          r5 = nil
        end
        s0 << r5
        if r5
          s6, i6 = [], index
          loop do
            r7 = _nt_digit
            if r7
              s6 << r7
            else
              break
            end
          end
          if s6.empty?
            self.index = i6
            r6 = nil
          else
            r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          end
          s0 << r6
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(FloatLiteral0)
      r0.extend(FloatLiteral1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:float_literal][start_index] = r0

    return r0
  end

  module CharLiteral0
    def val
      elements[1]
    end
  end

  module CharLiteral1
    def value
      val.each_byte{|b| b}
    end
  end

  def _nt_char_literal
    start_index = index
    if node_cache[:char_literal].has_key?(index)
      cached = node_cache[:char_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('?', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('?')
      r1 = nil
    end
    s0 << r1
    if r1
      if input.index(Regexp.new('[a-zA-Z0-9_]'), index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r2 = nil
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(CharLiteral0)
      r0.extend(CharLiteral1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:char_literal][start_index] = r0

    return r0
  end

  module ArrayLiteral0
    def item
      elements[2]
    end
  end

  module ArrayLiteral1
    def first_item
      elements[2]
    end

    def rest_items
      elements[4]
    end

  end

  module ArrayLiteral2
    def value
      if self.text_value =~ /\[\s*\]/
        "[]"
      else
        #[first_item.value] + rest_items.elements.collect{ |ws_and_items| ws_and_items.item.value }
        array_str = "[#{first_item.value},"
        rest_items.elements.each do |ws_and_items|
          array_str += "#{ws_and_items.item.value},"
        end
        array_str += "]"
        return array_str
      end
    end
  end

  def _nt_array_literal
    start_index = index
    if node_cache[:array_literal].has_key?(index)
      cached = node_cache[:array_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('[', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('[')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_ws
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        i5 = index
        r6 = _nt_literal
        if r6
          r5 = r6
        else
          r7 = _nt_identifier
          if r7
            r5 = r7
          else
            self.index = i5
            r5 = nil
          end
        end
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          s8, i8 = [], index
          loop do
            r9 = _nt_ws
            if r9
              s8 << r9
            else
              break
            end
          end
          r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
          s0 << r8
          if r8
            s10, i10 = [], index
            loop do
              i11, s11 = index, []
              if input.index(',', index) == index
                r12 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure(',')
                r12 = nil
              end
              s11 << r12
              if r12
                s13, i13 = [], index
                loop do
                  r14 = _nt_ws
                  if r14
                    s13 << r14
                  else
                    break
                  end
                end
                r13 = instantiate_node(SyntaxNode,input, i13...index, s13)
                s11 << r13
                if r13
                  i15 = index
                  r16 = _nt_literal
                  if r16
                    r15 = r16
                  else
                    r17 = _nt_identifier
                    if r17
                      r15 = r17
                    else
                      self.index = i15
                      r15 = nil
                    end
                  end
                  s11 << r15
                end
              end
              if s11.last
                r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
                r11.extend(ArrayLiteral0)
              else
                self.index = i11
                r11 = nil
              end
              if r11
                s10 << r11
              else
                break
              end
            end
            r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
            s0 << r10
            if r10
              s18, i18 = [], index
              loop do
                r19 = _nt_ws
                if r19
                  s18 << r19
                else
                  break
                end
              end
              r18 = instantiate_node(SyntaxNode,input, i18...index, s18)
              s0 << r18
              if r18
                if input.index(']', index) == index
                  r20 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure(']')
                  r20 = nil
                end
                s0 << r20
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ArrayLiteral1)
      r0.extend(ArrayLiteral2)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:array_literal][start_index] = r0

    return r0
  end

  module HashLiteral0
    def pair
      elements[2]
    end
  end

  module HashLiteral1
    def first_entry
      elements[2]
    end

    def rest_pairs
      elements[4]
    end

  end

  module HashLiteral2
    def value
      if self.text_value =~ /\{\s*\}/
        return "{}"
      else
        hash_str = "{"
        first_pair = first_entry.value
        hash_str += "#{first_pair[0]} => #{first_pair[1]},"
        rest_pairs.elements.each do |ws_and_pair|
          pair = ws_and_pair.pair
          hash_str += "#{pair[0]} => #{pair[1]},"
        end
        hash_str += "}"

        return hash_str
      end
    end
  end

  def _nt_hash_literal
    start_index = index
    if node_cache[:hash_literal].has_key?(index)
      cached = node_cache[:hash_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('{', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('{')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_ws
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        r5 = _nt_hash_entry
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          s6, i6 = [], index
          loop do
            r7 = _nt_ws
            if r7
              s6 << r7
            else
              break
            end
          end
          r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          s0 << r6
          if r6
            s8, i8 = [], index
            loop do
              i9, s9 = index, []
              if input.index(',', index) == index
                r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure(',')
                r10 = nil
              end
              s9 << r10
              if r10
                s11, i11 = [], index
                loop do
                  r12 = _nt_ws
                  if r12
                    s11 << r12
                  else
                    break
                  end
                end
                r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
                s9 << r11
                if r11
                  r13 = _nt_hash_entry
                  s9 << r13
                end
              end
              if s9.last
                r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
                r9.extend(HashLiteral0)
              else
                self.index = i9
                r9 = nil
              end
              if r9
                s8 << r9
              else
                break
              end
            end
            r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
            s0 << r8
            if r8
              s14, i14 = [], index
              loop do
                r15 = _nt_ws
                if r15
                  s14 << r15
                else
                  break
                end
              end
              r14 = instantiate_node(SyntaxNode,input, i14...index, s14)
              s0 << r14
              if r14
                if input.index('}', index) == index
                  r16 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure('}')
                  r16 = nil
                end
                s0 << r16
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(HashLiteral1)
      r0.extend(HashLiteral2)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:hash_literal][start_index] = r0

    return r0
  end

  module HashEntry0
    def key
      elements[0]
    end

    def val
      elements[4]
    end
  end

  module HashEntry1
    def value
      [key.value, val.value]
    end
  end

  def _nt_hash_entry
    start_index = index
    if node_cache[:hash_entry].has_key?(index)
      cached = node_cache[:hash_entry][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_literal
    if r2
      r1 = r2
    else
      r3 = _nt_identifier
      if r3
        r1 = r3
      else
        self.index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      s4, i4 = [], index
      loop do
        r5 = _nt_ws
        if r5
          s4 << r5
        else
          break
        end
      end
      r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
      s0 << r4
      if r4
        if input.index('=>', index) == index
          r6 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure('=>')
          r6 = nil
        end
        s0 << r6
        if r6
          s7, i7 = [], index
          loop do
            r8 = _nt_ws
            if r8
              s7 << r8
            else
              break
            end
          end
          r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
          s0 << r7
          if r7
            i9 = index
            r10 = _nt_literal
            if r10
              r9 = r10
            else
              r11 = _nt_identifier
              if r11
                r9 = r11
              else
                self.index = i9
                r9 = nil
              end
            end
            s0 << r9
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(HashEntry0)
      r0.extend(HashEntry1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:hash_entry][start_index] = r0

    return r0
  end

  def _nt_block_literal
    start_index = index
    if node_cache[:block_literal].has_key?(index)
      cached = node_cache[:block_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_block_literal_do_end
    if r1
      r0 = r1
    else
      r2 = _nt_block_literal_curly_braces
      if r2
        r0 = r2
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:block_literal][start_index] = r0

    return r0
  end

  module BlockLiteralDoEnd0
    def do_keyword
      elements[0]
    end

    def params
      elements[4]
    end

    def body
      elements[6]
    end

    def end_keyword
      elements[8]
    end
  end

  def _nt_block_literal_do_end
    start_index = index
    if node_cache[:block_literal_do_end].has_key?(index)
      cached = node_cache[:block_literal_do_end][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_do_keyword
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_ws
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        i4 = index
        r5 = _nt_hash_entry
        if r5
          r4 = nil
        else
          self.index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          s6, i6 = [], index
          loop do
            r7 = _nt_ws
            if r7
              s6 << r7
            else
              break
            end
          end
          r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          s0 << r6
          if r6
            r9 = _nt_block_params
            if r9
              r8 = r9
            else
              r8 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r8
            if r8
              s10, i10 = [], index
              loop do
                r11 = _nt_ws
                if r11
                  s10 << r11
                else
                  break
                end
              end
              r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
              s0 << r10
              if r10
                r12 = _nt_block_body
                s0 << r12
                if r12
                  s13, i13 = [], index
                  loop do
                    r14 = _nt_ws
                    if r14
                      s13 << r14
                    else
                      break
                    end
                  end
                  r13 = instantiate_node(SyntaxNode,input, i13...index, s13)
                  s0 << r13
                  if r13
                    r15 = _nt_end_keyword
                    s0 << r15
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(BlockLiteralNode,input, i0...index, s0)
      r0.extend(BlockLiteralDoEnd0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:block_literal_do_end][start_index] = r0

    return r0
  end

  module BlockLiteralCurlyBraces0
    def params
      elements[4]
    end

    def body
      elements[6]
    end

  end

  def _nt_block_literal_curly_braces
    start_index = index
    if node_cache[:block_literal_curly_braces].has_key?(index)
      cached = node_cache[:block_literal_curly_braces][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('{', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('{')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_ws
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        i4 = index
        r5 = _nt_hash_entry
        if r5
          r4 = nil
        else
          self.index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          s6, i6 = [], index
          loop do
            r7 = _nt_ws
            if r7
              s6 << r7
            else
              break
            end
          end
          r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          s0 << r6
          if r6
            r9 = _nt_block_params
            if r9
              r8 = r9
            else
              r8 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r8
            if r8
              s10, i10 = [], index
              loop do
                r11 = _nt_ws
                if r11
                  s10 << r11
                else
                  break
                end
              end
              r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
              s0 << r10
              if r10
                r12 = _nt_block_body
                s0 << r12
                if r12
                  s13, i13 = [], index
                  loop do
                    r14 = _nt_ws
                    if r14
                      s13 << r14
                    else
                      break
                    end
                  end
                  r13 = instantiate_node(SyntaxNode,input, i13...index, s13)
                  s0 << r13
                  if r13
                    if input.index('}', index) == index
                      r15 = instantiate_node(SyntaxNode,input, index...(index + 1))
                      @index += 1
                    else
                      terminal_parse_failure('}')
                      r15 = nil
                    end
                    s0 << r15
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(BlockLiteralNode,input, i0...index, s0)
      r0.extend(BlockLiteralCurlyBraces0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:block_literal_curly_braces][start_index] = r0

    return r0
  end

  module BlockBody0
    def exprs
      elements[1]
    end

  end

  module BlockBody1
    def value
      body_str = ""
      body_str += exprs.elements.collect{|e| e.elements[0].value}.join(";")
      return body_str
    end
  end

  def _nt_block_body
    start_index = index
    if node_cache[:block_body].has_key?(index)
      cached = node_cache[:block_body][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      r2 = _nt_ws
      if r2
        s1 << r2
      else
        break
      end
    end
    r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        r4 = _nt_expression
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        self.index = i3
        r3 = nil
      else
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      end
      s0 << r3
      if r3
        s5, i5 = [], index
        loop do
          r6 = _nt_ws
          if r6
            s5 << r6
          else
            break
          end
        end
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(BlockBody0)
      r0.extend(BlockBody1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:block_body][start_index] = r0

    return r0
  end

  module BlockParams0
    def params
      elements[1]
    end

  end

  module BlockParams1
    def value
#        block_param_str = "|"
#        block_param_str += params.elements.collect{|param| param.value}.join(",")
#        block_param_str += "| "
#        return block_param_str
      params.elements.collect{|param| param.value}
    end
  end

  def _nt_block_params
    start_index = index
    if node_cache[:block_params].has_key?(index)
      cached = node_cache[:block_params][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('|', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('|')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_block_param
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        self.index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        if input.index('|', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('|')
          r4 = nil
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(BlockParams0)
      r0.extend(BlockParams1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:block_params][start_index] = r0

    return r0
  end

  module BlockParam0
    def identifier
      elements[0]
    end

  end

  module BlockParam1
    def param_name
      elements[1]
    end

    def param_name_val
      elements[2]
    end

  end

  module BlockParam2
    def param_name_val
      elements[1]
    end
  end

  module BlockParam3
    def value
      # holds param name (if given) with param value (the identifier in the body of the block)
      name_identifier_pair = {}
      if param_name.text_value =~ /\S+\:/
        # return the param-name as a symbol (start with a colon)
        # without the final colon & space, since it's not part of the name
        name_identifier_pair[:name] = ":#{param_name.text_value[0..-3]}"
      end
      name_identifier_pair[:identifier] = param_name_val.value
      return name_identifier_pair
    end
  end

  def _nt_block_param
    start_index = index
    if node_cache[:block_param].has_key?(index)
      cached = node_cache[:block_param][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    s2, i2 = [], index
    loop do
      r3 = _nt_ws
      if r3
        s2 << r3
      else
        break
      end
    end
    r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
    s1 << r2
    if r2
      i5, s5 = index, []
      r6 = _nt_identifier
      s5 << r6
      if r6
        if input.index(': ', index) == index
          r7 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure(': ')
          r7 = nil
        end
        s5 << r7
      end
      if s5.last
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        r5.extend(BlockParam0)
      else
        self.index = i5
        r5 = nil
      end
      if r5
        r4 = r5
      else
        r4 = instantiate_node(SyntaxNode,input, index...index)
      end
      s1 << r4
      if r4
        r8 = _nt_identifier
        s1 << r8
        if r8
          s9, i9 = [], index
          loop do
            r10 = _nt_ws
            if r10
              s9 << r10
            else
              break
            end
          end
          r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
          s1 << r9
        end
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(BlockParam1)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
      r0.extend(BlockParam3)
    else
      i11, s11 = index, []
      s12, i12 = [], index
      loop do
        r13 = _nt_ws
        if r13
          s12 << r13
        else
          break
        end
      end
      if s12.empty?
        self.index = i12
        r12 = nil
      else
        r12 = instantiate_node(SyntaxNode,input, i12...index, s12)
      end
      s11 << r12
      if r12
        r14 = _nt_identifier
        s11 << r14
      end
      if s11.last
        r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
        r11.extend(BlockParam2)
      else
        self.index = i11
        r11 = nil
      end
      if r11
        r0 = r11
        r0.extend(BlockParam3)
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:block_param][start_index] = r0

    return r0
  end

  module RegexLiteral0
  end

  module RegexLiteral1
  end

  module RegexLiteral2
    def value
      self.text_value
    end
  end

  def _nt_regex_literal
    start_index = index
    if node_cache[:regex_literal].has_key?(index)
      cached = node_cache[:regex_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('/', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('/')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        i4 = index
        if input.index('/', index) == index
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('/')
          r5 = nil
        end
        if r5
          r4 = nil
        else
          self.index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s3 << r4
        if r4
          if index < input_length
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("any character")
            r6 = nil
          end
          s3 << r6
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(RegexLiteral0)
        else
          self.index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        if input.index('/', index) == index
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('/')
          r7 = nil
        end
        s0 << r7
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(RegexLiteral1)
      r0.extend(RegexLiteral2)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:regex_literal][start_index] = r0

    return r0
  end

  module Identifier0
  end

  module Identifier1
  end

  def _nt_identifier
    start_index = index
    if node_cache[:identifier].has_key?(index)
      cached = node_cache[:identifier][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i2 = index
    if input.index('@', index) == index
      r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('@')
      r3 = nil
    end
    if r3
      r2 = r3
    else
      if input.index('@@', index) == index
        r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('@@')
        r4 = nil
      end
      if r4
        r2 = r4
      else
        self.index = i2
        r2 = nil
      end
    end
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      i5 = index
      s6, i6 = [], index
      loop do
        if input.index(Regexp.new('[a-zA-Z]'), index) == index
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r7 = nil
        end
        if r7
          s6 << r7
        else
          break
        end
      end
      if s6.empty?
        self.index = i6
        r6 = nil
      else
        r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
      end
      if r6
        r5 = r6
      else
        i8, s8 = index, []
        if input.index('$', index) == index
          r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('$')
          r9 = nil
        end
        s8 << r9
        if r9
          if input.index(Regexp.new('[0-9]'), index) == index
            r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            r10 = nil
          end
          s8 << r10
        end
        if s8.last
          r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
          r8.extend(Identifier0)
        else
          self.index = i8
          r8 = nil
        end
        if r8
          r5 = r8
        else
          self.index = i5
          r5 = nil
        end
      end
      s0 << r5
      if r5
        s11, i11 = [], index
        loop do
          if input.index(Regexp.new('[a-zA-Z0-9_]'), index) == index
            r12 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            r12 = nil
          end
          if r12
            s11 << r12
          else
            break
          end
        end
        r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
        s0 << r11
      end
    end
    if s0.last
      r0 = instantiate_node(IdentifierNode,input, i0...index, s0)
      r0.extend(Identifier1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:identifier][start_index] = r0

    return r0
  end

  module MessageName0
  end

  module MessageName1
    def value
      self.text_value
    end
  end

  def _nt_message_name
    start_index = index
    if node_cache[:message_name].has_key?(index)
      cached = node_cache[:message_name][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if input.index(Regexp.new('[a-zA-Z]'), index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      self.index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        if input.index(Regexp.new('[a-zA-Z0-9_]'), index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s0 << r3
      if r3
        i6 = index
        if input.index('?', index) == index
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('?')
          r7 = nil
        end
        if r7
          r6 = r7
        else
          if input.index('!', index) == index
            r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('!')
            r8 = nil
          end
          if r8
            r6 = r8
          else
            if input.index('=', index) == index
              r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('=')
              r9 = nil
            end
            if r9
              r6 = r9
            else
              self.index = i6
              r6 = nil
            end
          end
        end
        if r6
          r5 = r6
        else
          r5 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(MessageName0)
      r0.extend(MessageName1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:message_name][start_index] = r0

    return r0
  end

  module Operator0
  end

  module Operator1
    def operator_symbol
      elements[0]
    end

  end

  module Operator2
    def value
      self.text_value
    end
  end

  def _nt_operator
    start_index = index
    if node_cache[:operator].has_key?(index)
      cached = node_cache[:operator][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if input.index('=', index) == index
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('=')
      r2 = nil
    end
    s1 << r2
    if r2
      s3, i3 = [], index
      loop do
        r4 = _nt_operator_symbol
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        self.index = i3
        r3 = nil
      else
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      end
      s1 << r3
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Operator0)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i5, s5 = index, []
      r6 = _nt_operator_symbol
      s5 << r6
      if r6
        if input.index('=', index) == index
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('=')
          r7 = nil
        end
        s5 << r7
        if r7
          s8, i8 = [], index
          loop do
            r9 = _nt_operator_symbol
            if r9
              s8 << r9
            else
              break
            end
          end
          r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
          s5 << r8
        end
      end
      if s5.last
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        r5.extend(Operator1)
      else
        self.index = i5
        r5 = nil
      end
      if r5
        r0 = r5
      else
        s10, i10 = [], index
        loop do
          r11 = _nt_operator_symbol
          if r11
            s10 << r11
          else
            break
          end
        end
        if s10.empty?
          self.index = i10
          r10 = nil
        else
          r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
          r10.extend(Operator2)
        end
        if r10
          r0 = r10
        else
          self.index = i0
          r0 = nil
        end
      end
    end

    node_cache[:operator][start_index] = r0

    return r0
  end

  def _nt_operator_symbol
    start_index = index
    if node_cache[:operator_symbol].has_key?(index)
      cached = node_cache[:operator_symbol][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    if input.index('<=', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('<=')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if input.index('>=', index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('>=')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if input.index('<', index) == index
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('<')
          r3 = nil
        end
        if r3
          r0 = r3
        else
          if input.index('>', index) == index
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('>')
            r4 = nil
          end
          if r4
            r0 = r4
          else
            if input.index('==', index) == index
              r5 = instantiate_node(SyntaxNode,input, index...(index + 2))
              @index += 2
            else
              terminal_parse_failure('==')
              r5 = nil
            end
            if r5
              r0 = r5
            else
              if input.index('!=', index) == index
                r6 = instantiate_node(SyntaxNode,input, index...(index + 2))
                @index += 2
              else
                terminal_parse_failure('!=')
                r6 = nil
              end
              if r6
                r0 = r6
              else
                if input.index('+=', index) == index
                  r7 = instantiate_node(SyntaxNode,input, index...(index + 2))
                  @index += 2
                else
                  terminal_parse_failure('+=')
                  r7 = nil
                end
                if r7
                  r0 = r7
                else
                  if input.index('-=', index) == index
                    r8 = instantiate_node(SyntaxNode,input, index...(index + 2))
                    @index += 2
                  else
                    terminal_parse_failure('-=')
                    r8 = nil
                  end
                  if r8
                    r0 = r8
                  else
                    if input.index('&', index) == index
                      r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
                      @index += 1
                    else
                      terminal_parse_failure('&')
                      r9 = nil
                    end
                    if r9
                      r0 = r9
                    else
                      if input.index('.', index) == index
                        r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                        @index += 1
                      else
                        terminal_parse_failure('.')
                        r10 = nil
                      end
                      if r10
                        r0 = r10
                      else
                        if input.index('+', index) == index
                          r11 = instantiate_node(SyntaxNode,input, index...(index + 1))
                          @index += 1
                        else
                          terminal_parse_failure('+')
                          r11 = nil
                        end
                        if r11
                          r0 = r11
                        else
                          if input.index('-', index) == index
                            r12 = instantiate_node(SyntaxNode,input, index...(index + 1))
                            @index += 1
                          else
                            terminal_parse_failure('-')
                            r12 = nil
                          end
                          if r12
                            r0 = r12
                          else
                            if input.index('/', index) == index
                              r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
                              @index += 1
                            else
                              terminal_parse_failure('/')
                              r13 = nil
                            end
                            if r13
                              r0 = r13
                            else
                              if input.index('*', index) == index
                                r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
                                @index += 1
                              else
                                terminal_parse_failure('*')
                                r14 = nil
                              end
                              if r14
                                r0 = r14
                              else
                                if input.index('|', index) == index
                                  r15 = instantiate_node(SyntaxNode,input, index...(index + 1))
                                  @index += 1
                                else
                                  terminal_parse_failure('|')
                                  r15 = nil
                                end
                                if r15
                                  r0 = r15
                                else
                                  if input.index('=~', index) == index
                                    r16 = instantiate_node(SyntaxNode,input, index...(index + 2))
                                    @index += 2
                                  else
                                    terminal_parse_failure('=~')
                                    r16 = nil
                                  end
                                  if r16
                                    r0 = r16
                                  else
                                    self.index = i0
                                    r0 = nil
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:operator_symbol][start_index] = r0

    return r0
  end

  def _nt_ws
    start_index = index
    if node_cache[:ws].has_key?(index)
      cached = node_cache[:ws][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[\\n\\s\\t]'), index) == index
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:ws][start_index] = r0

    return r0
  end

  def _nt_spaces
    start_index = index
    if node_cache[:spaces].has_key?(index)
      cached = node_cache[:spaces][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[\\s\\t]'), index) == index
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:spaces][start_index] = r0

    return r0
  end

  def _nt_line_breaking_ws
    start_index = index
    if node_cache[:line_breaking_ws].has_key?(index)
      cached = node_cache[:line_breaking_ws][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[\\n\\s\\t]'), index) == index
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:line_breaking_ws][start_index] = r0

    return r0
  end

  def _nt_newline
    start_index = index
    if node_cache[:newline].has_key?(index)
      cached = node_cache[:newline][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[\\n]'), index) == index
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:newline][start_index] = r0

    return r0
  end

  module DoKeyword0
  end

  def _nt_do_keyword
    start_index = index
    if node_cache[:do_keyword].has_key?(index)
      cached = node_cache[:do_keyword][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('do', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('do')
      r1 = nil
    end
    s0 << r1
    if r1
      i2 = index
      if input.index(Regexp.new('[a-zA-Z0-9_]'), index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r3 = nil
      end
      if r3
        r2 = nil
      else
        self.index = i2
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
      if r2
        i4 = index
        r5 = _nt_ws
        if r5
          self.index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        else
          r4 = nil
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(DoKeyword0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:do_keyword][start_index] = r0

    return r0
  end

  module EndKeyword0
  end

  def _nt_end_keyword
    start_index = index
    if node_cache[:end_keyword].has_key?(index)
      cached = node_cache[:end_keyword][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('end', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('end')
      r1 = nil
    end
    s0 << r1
    if r1
      i2 = index
      if input.index(Regexp.new('[a-zA-Z0-9_]'), index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r3 = nil
      end
      if r3
        r2 = nil
      else
        self.index = i2
        r2 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(EndKeyword0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:end_keyword][start_index] = r0

    return r0
  end

  def _nt_non_zero_digit
    start_index = index
    if node_cache[:non_zero_digit].has_key?(index)
      cached = node_cache[:non_zero_digit][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index(Regexp.new('[1-9]'), index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:non_zero_digit][start_index] = r0

    return r0
  end

  def _nt_digit
    start_index = index
    if node_cache[:digit].has_key?(index)
      cached = node_cache[:digit][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index(Regexp.new('[0-9]'), index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:digit][start_index] = r0

    return r0
  end

  def _nt_sign
    start_index = index
    if node_cache[:sign].has_key?(index)
      cached = node_cache[:sign][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    if input.index('+', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('+')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if input.index('-', index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('-')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:sign][start_index] = r0

    return r0
  end

end

class BlockdParser < Treetop::Runtime::CompiledParser
  include Blockd
end

