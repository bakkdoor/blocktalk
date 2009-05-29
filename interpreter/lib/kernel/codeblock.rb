module Kernel
  class Codeblock < Proc
    attr_reader :params, :block

    def initialize(params, &block)
      if params.size != (block.arity - 1)
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
      super(*([args.first] + calling_args))
    end

    def param_pos(param_name)
      if @params.include?(param_name)
        @params.index(param_name)
      else
        nil
      end
    end
  end
end
