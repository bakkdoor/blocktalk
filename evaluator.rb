class Evaluator
  @expressions = []
  def self.add(code_str)
    unless code_str.nil? or code_str.empty?
      @expressions << code_str
    end
  end

  def self.eval(argv = [])
    load_path = File.dirname(__FILE__)
#    Kernel::eval @expressions.join(";")
    system("/usr/bin/env ruby -e 'require \"#{load_path}/lib/core\";#{@expressions.join(';')}' #{argv.join(' ')}")
  end

  def self.inspect
    Kernel::puts @expressions.join("\n")
  end
end
