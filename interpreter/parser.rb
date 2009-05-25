class Parser
  def initialize(parse_file)
    @parse_file = parse_file
    @lines = []
  end

  def parse_line(line)
    line = line.split("#")[0] # ignore everything after comment
    # split by whitespace & keywords

    tokens = line.split(/\s/)
    tokens = tokens.reject{|t| t.empty?}

    return tokens
  end

  def parse
    File.open(@parse_file, "r") do |f|
      @lines = f.readlines
    end

    tokens = []
    @lines.each do |l|
      tokens << parse_line(l)
    end

    tokens.reject{|t| t.empty?}#.collect{|token_line| token_line.join(" ")}.join("; ")
  end
end
