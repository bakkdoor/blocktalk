class Error < StandardError
  def self.raise(error_obj)
    Kernel::raise error_obj
  end
end

class RuntimeError
  def self.raise(message)
    Kernel::raise(message)
  end
end
