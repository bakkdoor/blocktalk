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
end
