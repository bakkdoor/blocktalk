#!/usr/bin/env ruby

# expand search path correct subdir.
$: << File.expand_path(File.dirname(__FILE__))

require "lib/core"
require "parser"
require "pp"

if ARGV.size < 1
  raise "Error: Please specify a source file to interpret."
end

parse_file = ARGV[0]
#parser = Parser.new(parse_file)
ast = Parser.new(parse_file).parse
PP.pp ast
