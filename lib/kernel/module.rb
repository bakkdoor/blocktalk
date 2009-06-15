class Module
  @@mod_stack = []
  def self.in(module_name_sym, &block)
    parent_mod = (["Kernel"] + @@mod_stack).join('::')

    str = <<-REND
        unless #{parent_mod}.const_defined?('#{module_name_sym}')
          #{parent_mod}.module_eval '#{module_name_sym} = Module.new'
        end
    REND
    Kernel.module_eval str

    @@mod_stack.push module_name_sym

    mod = Kernel.module_eval("#{@@mod_stack.join('::')}")
    mod.module_eval(&block)

    @@mod_stack.pop
  end

  def self.>>(module_name_sym, &block)
    self.in(module_name_sym, &block)
  end

  def extend(&block)
    self.module_eval(&block)
  end
end
