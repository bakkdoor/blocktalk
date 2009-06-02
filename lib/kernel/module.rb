class Module
  def self.in(module_name_sym, &block)
    if Kernel::constants.include?(module_name_sym.to_s)
      moduleobj = Kernel::const_get(module_name_sym)
      moduleobj.module_eval(&block)
    else
      Kernel::const_set(module_name_sym, Module.new(&block))
    end
  end

  def self.>>(module_name_sym, &block)
    self.in(module_name_sym, &block)
  end

  def extend(&block)
    self.module_eval(&block)
  end
end
