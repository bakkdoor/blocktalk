class Class
  def self.in(class_name_sym, superclass_name_sym = nil, &block)
    if superclass_name_sym
      Kernel::const_set(class_name_sym, Class.new(superclass_name_sym, &block))
    else
      Kernel::const_set(class_name_sym, Class.new(&block))
    end
  end
end
