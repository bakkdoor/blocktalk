class Class
  def self.in(class_name_sym, &block)
    self.in__subclassing(class_name_sym, Object, &block)
  end

  def self.in__subclassing(class_name_sym, superclass = Object, &block)
    if Kernel::constants.include?(class_name_sym.to_s)
      classobj = Kernel::const_get(class_name_sym)
      classobj.class_eval(&block)
    else
      Kernel::const_set(class_name_sym, Class.new(superclass, &block))
    end
  end

  def self.>>(class_name_sym, &block)
    class_name = class_name_sym
    superclass = Object # default

    if class_name_sym.is_a?(Hash)
      class_name = class_name_sym.keys.first
      superclass = class_name_sym.values.first
    end

    self.in__subclassing(class_name, superclass, &block)
  end

  def extend(&block)
    self.class_eval(&block)
  end

  def mixin(modules = [])
    modules.each do |m|
      self.class_eval do
        include m
      end
    end
  end

  def meta_class
    class << self
      self
    end
  end
end
