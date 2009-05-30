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
      if classobj = Kernel::const_get(class_name_sym)
        classobj.class_eval(&block)
      else
        Kernel::const_set(class_name_sym, Class.new(&block))
      end
    end
  end

  def extend(&block)
    self.class_eval(&block)
  end
end
