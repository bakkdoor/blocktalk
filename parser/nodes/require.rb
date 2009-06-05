module Blocktalk
  class RequireNode < Treetop::Runtime::SyntaxNode
    def value
      parser = BlocktalkParser.new

      file = parse_file.text_value

      unless file.include?(".bt")
        file += ".bt"
      end

      file = file.gsub(/\"/, "")

      $:.each do |path|
        if File.exists?("#{path}/#{file}")
          ast = parser.parse IO.read("#{path}/#{file}")
          ast.evaluate
          return nil # only require once!
        end
      end

      nil
    end
  end
end
