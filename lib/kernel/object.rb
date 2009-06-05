class Object
  def if_true__if_false(true_block = nil, false_block = nil)
    if self == true
      if true_block
        true_block.call
      elsif block_given?
        yield
      end
    else
      if false_block
        false_block.call
      end
    end
  end

  def if_false(&block)
    if self == false
      block.call
    end
  end

  def if(&block)
    if self
      block.call
    end
  end

  def unless(&block)
    unless self
      block.call
    end
  end

  # this should get called, if we try to call a method on objects of
  # ruby classes.
  # it will try to find the correct ruby method-name & clall it.
  def method_missing(name, *args, &block)
    # probably a blocktalk_like method was called, when we actually
    # ment a ruby method
    splitted = name.to_s.split("__")
    if splitted.size == 2
      ruby_name = splitted.first

      # hopefully, we got it right
      # to make us not do the work again simply create the method for
      # later use and then call it
      arg_names = 0.upto(args.size - 1).collect{|i| "arg_#{i}"}
      self.instance_eval "def #{name}(#{arg_names.join(',')}, &block); self.send(:#{ruby_name}, #{arg_names.join(',')}, &block); end;"
      # now call!
      self.send(ruby_name, *args, &block)
    else
      raise "Unknown method, don't know what to do: #{self.class}##{name}"
     end
  end
end
