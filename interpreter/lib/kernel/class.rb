class Class
  def self.in(class_name_sym, superclass_name_sym = nil, &block)
    if superclass_name_sym
      if Kernel::constants.include?(class_name_sym)
        classobj = Kernel::const_get(class_name_sym)
        classobj.class_eval(&block)
      else
        Kernel::const_set(class_name_sym, Class.new(superclass_name_sym, &block))
      end
    else
      if Kernel::constants.include?(class_name_sym)
        classobj = Kernel::const_get(class_name_sym)
        classobj.class_eval(&block)
      else
        Kernel::const_set(class_name_sym, Class.new(&block))
      end
    end
  end

  def self.>>(class_name_sym, &block)
    class_name = class_name_sym
    superclass_name = nil

    if class_name_sym.is_a?(Hash)
      class_name = class_name_sym.keys.first
      superclass_name = class_name_sym.values.first
    end

    self.in(class_name, superclass_name, &block)
  end

  def extend(&block)
    self.class_eval(&block)
  end
end
