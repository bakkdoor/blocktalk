Enumerable = Module new {
  collect = { |block|
    arr = Array.new
    self each: do |x|
      arr << (block call: x)
    end
    arr
  }

  map = (collect)


  select = { |block|
    arr = Array new: (self size)
    self each: do |x|
      (block call: x) if_true do
        arr << x
      end
    end
    arr
  }

  reject = { |block|
    arr = Array new: (self size)
    self each do |x|
      (block call: x) if_false do
        arr << x
      end
    end
    arr
  }

  inject = { |initial=nil|
    (initial nil?)
    |> if_true do

    end

    |> if_false do

    end
  }

  empty? = { (self size) == 0 }
}
