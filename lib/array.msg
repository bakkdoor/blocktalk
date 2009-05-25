Array = Class new {
  << = { |element|
    # do some stuff here to add element to array at end
  }

  push = (<<)
  add = (<<)

  pop = {
    # top-of-stack (tos) = last element in array.
    tos = last
    #self remove: tos
    # or shorter (since 'self' is implicit here):
    remove: tos
    tos
  }

  peek = (last)

  each = { |block|
    0 to: (self size) do |index|
      block call: (self at: index)
    end
  }

  # ... and many more
}
