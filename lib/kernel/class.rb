class Class
  def self.in(class_name_sym, &block)
    self.in__subclassing(class_name_sym, Object, &block)
  end

  def self.in__subclassing(class_name_sym, superclass = Object, &block)
    # try to find class via const_get
    # if error occurs (not found), define a new class with the given name
    current_module = Module.current
    begin
      classobj = current_module.const_get(class_name_sym)
      classobj.class_eval(&block)
    rescue
      current_module.const_set(class_name_sym, Class.new(superclass, &block))
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

  def extend_class(&block)
    self.class_eval(&block)
  end

  def mixin(modules = [])
    modules.each do |m|
      self.class_eval do
        include m
      end
    end
  end
end
