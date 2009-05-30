class Object
  def if_true(&block)
    if self == true
      block.call
    end
  end

  def if_false(&block)
    if self == false
      block.call
    end
  end
end
