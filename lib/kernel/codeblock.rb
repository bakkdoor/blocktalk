module Kernel
  class Codeblock < Proc

    def self.register(codeblock_identifier)
      @@identifiers ||= []
      if codeblock_identifier
        @@identifiers << codeblock_identifier
      end
    end

    attr_reader :params, :block

    def initialize(params = [], &block)
      if params.size > 0 && (params.size != block.arity)
        raise "Error: Codeblock's arity doesn't match given argument list."
      else
        super(&block)
        @params = params
        @block = block
      end
    end

    def call(*args)
      calling_args = []
      args.rest.each do |arg_name_with_val|
        name, val = arg_name_with_val
        if name && val
          pos = param_pos(name)
          puts "pos: #{pos}"
          calling_args[pos] = val
        end
      end
      if calling_args.size > 0
        super(*([args.first] + calling_args))
      else
        super(*args)
      end
    end

    def param_pos(param_name)
      if @params.include?(param_name)
        @params.index(param_name)
      else
        nil
      end
    end

    def while_true(&block)
      while self.call
        block.call
      end
    end

    def while_false(&block)
      while not self.call
        block.call
      end
    end

    def until(&block)
      self.while_false(&block)
    end
  end
end