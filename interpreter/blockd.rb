#!/usr/bin/env ruby

require "rubygems"
require "treetop"

# expand search path correct subdir.
$: << File.expand_path(File.dirname(__FILE__))

require "lib/core"
require "pp"
require "evaluator"

# parser nodes
Dir.glob("parser/nodes/*.rb").each{ |f| require f }

# load grammar
Treetop.load "grammar/blockd.tt"


if ARGV.size < 1
  raise "Error: Please specify a source file to interpret."
end


parse_file = ARGV[0]
parser = BlockdParser.new
ast = parser.parse IO.read(parse_file)
#PP.pp ast

#PP.pp ast.elements.select{|e| e.is_a?(Blockd::AssignmentNode)}
# ast.elements.each do |e|
#   PP.pp e
#   puts ""
#end
#puts ast.elements.inspect
i = 0
ast.value

debug_on =  ARGV.include?("--debug")

if debug_on
  puts ast.inspect
  puts "\n============================================================\n\n"
  puts "--------------------\n"
  puts "Generated Ruby code:\n"
  puts "--------------------\n\n"
  Evaluator.inspect
  puts "\n============================================================\n\n"
end

Evaluator.eval

if debug_on
  puts
end
