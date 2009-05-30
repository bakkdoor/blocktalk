class Console
  def self.puts(*args)
    Kernel::puts *args
  end

  def self.print(*args)
    Kernel::print *args
  end

  def self.gets(prompt_str = nil)
    if prompt_str
      self.print(prompt_str.to_s + " ")
    end
    Kernel::gets
  end
end
