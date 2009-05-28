class Evaluator
  @expressions = []
  def self.add(code_str)
    @expressions << code_str
  end

  def self.eval
    Kernel::eval @expressions.join("\n")
  end

  def self.inspect
    Kernel::puts @expressions.join("\n")
  end
end
