Enumerable = Module new {
  collect = {
    arr = Array.new
    self each do |x|
      arr << (yield x)
    end
    arr
  }

  map = (collect)


  select = {
    arr = Array new: (self size)
    self each do |x|
      (yield x) if_true do
        arr << x
      end
    end
    arr
  }

  reject = {
    arr = Array new: (self size)
    self each do |x|
      (yield x) if_false do
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
