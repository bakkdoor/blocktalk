class Evaluator
  @load_path = File.dirname(__FILE__)
  @expressions = ["require \"#{@load_path}/lib/core\""]

  def self.add(code_str)
    unless code_str.nil? or code_str.empty?
      @expressions << code_str
    end
  end

  def self.eval(argv = [])
#    Kernel::eval @expressions.join(";")
    system("/usr/bin/env ruby -e '#{@expressions.join(';')}' #{argv.join(' ')}")
  end

  def self.inspect
    Kernel::puts @expressions.join("\n")
  end
end
