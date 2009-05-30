class Evaluator
  @expressions = []
  def self.add(code_str)
    unless code_str.nil? or code_str.empty?
      @expressions << code_str
    end
  end

  def self.eval
    Kernel::eval @expressions.join(";")
  end

  def self.inspect
    Kernel::puts @expressions.join("\n")
  end
end
