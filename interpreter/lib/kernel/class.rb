class Class
  def subclass(child_class_name, &block)
    Kernel.module_eval do
      const_set child_class_name, Class.new(self.class, &block)
    end
  end
end

class Codeblock < Proc
  attr_reader :params, :block

  def initialize(params, &block)
    super(&block)
    @params = params
    @block = block
  end
end
