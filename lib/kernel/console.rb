class Console
  def self.puts(*args)
    Kernel::puts *args
  end

  def self.print(*args)
    Kernel::print *args
  end

  def self.putc(*args)
    Kernel::putc(*args)
  end

  def self.printf(arg_array)
    Kernel::printf(*arg_array)
  end

  def self.write(*args)
    Kernel::print(*args)
  end

  def self.writeln(*args)
    Kernel::puts(*args)
  end

  def self.gets(prompt_str = nil)
    if prompt_str
      self.print(prompt_str.to_s + " ")
    end
    Kernel::gets
  end

  def self.readln(prompt_str = nil)
    gets(prompt_str)
  end

  def self.clear
    puts "\e[H\e[2J"
  end
end
