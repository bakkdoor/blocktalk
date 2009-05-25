module Kernel
  class Codeblock < Proc
    attr_reader :params, :block

    def initialize(params, &block)
      super(&block)
      @params = params
      @block = block
    end
  end
end
