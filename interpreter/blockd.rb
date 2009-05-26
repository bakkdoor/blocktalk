#!/usr/bin/env ruby

require "rubygems"
require "treetop"

# expand search path correct subdir.
$: << File.expand_path(File.dirname(__FILE__))

require "lib/core"
require "pp"
#require "grammar/blockd.tt" # this will get loaded with treetop to generate the BlockdParser

Treetop.load "grammar/blockd.tt"

if ARGV.size < 1
  raise "Error: Please specify a source file to interpret."
end

parse_file = ARGV[0]
parser = BlockdParser.new
ast = parser.parse IO.read(parse_file)
PP.pp ast
