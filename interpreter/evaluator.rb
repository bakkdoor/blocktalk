class Evaluator
  @expressions = []
  def self.add(code_str)
    @expressions << code_str
  end

  def self.eval
    Kernel::eval @expressions.select{|e| not (e.nil? or e.empty?)}.join("\n")
  end

  def self.inspect
    Kernel::puts @expressions.select{|e| not (e.nil? or e.empty?)}.join("\n")
  end
end
