$gemspec = Gem::Specification.new do |s|
  s.name = "blocktalk"
  s.version = "0.1.5"
  s.author = "Christopher Bertels"
  s.email = "bakkdoor@flasht.de"
  s.homepage = "http://www.adztec-independent.de"
  s.platform = Gem::Platform::RUBY
  s.summary = "Blocktalk is a dynamic, object-oriented programming language somewhat in the tradition of Smalltalk and Ruby."
#  s.files = ["README.markdown", "benchmark.bt", "TODO", "LICENSE", "evaluator.rb", "version.rb",
#             "{grammar,lib,bin,examples,language-spec,parser}/**/*"].map{|p| Dir[p]}.flatten
  s.files = ["README.markdown", "benchmark.bt", "TODO", "LICENSE", "evaluator.rb", "version.rb",
             "grammar/blocktalk.tt", "grammar/blocktalk.rb",
             "lib/core.rb",
             "lib/kernel", "lib/kernel/console.rb", "lib/kernel/array.rb", "lib/kernel/error.rb", "lib/kernel/module.rb",
             "lib/kernel/string.rb", "lib/kernel/class.rb", "lib/kernel/codeblock.rb", "lib/kernel/system.rb", "lib/kernel/object.rb",
             "lib/blocktalk", "lib/blocktalk/hash.bt", "lib/blocktalk/string.bt", "lib/blocktalk/array.bt", "lib/blocktalk.bt",
             "bin/blocktalk",
             "examples/webserver.bt", "examples/test3.bt", "examples/fac.bt", "examples/chained_method_call.bt", 
	     "examples/exceptions.bt", "examples/string_interpol.bt", "examples/test2.bt",
             "examples/literals.bt", "examples/ruby_methods.bt", "examples/multiple_methodcall.bt", "examples/linecounter.bt",
             "examples/require.bt", "examples/portscan.bt", "examples/conditionals.bt", "examples/classes_modules.bt", "examples/test.bt",
             "examples/string_test.bt", "examples/inline_ruby.bt",
             "language-spec/blocktalk-lang-spec.bt", "language-spec/blocktalk-example.bt",
             "parser/helpers", "parser/helpers/method_definitions.rb", "parser/helpers/methodcalls.rb",
             "parser/nodes.rb", "parser/nodes", "parser/nodes/message_without_params.rb", "parser/nodes/block_literal.rb",
             "parser/nodes/integer_literal.rb", "parser/nodes/require.rb", "parser/nodes/expression.rb", "parser/nodes/try.rb",
             "parser/nodes/comment.rb", "parser/nodes/multiple_methodcall.rb", "parser/nodes/root.rb", "parser/nodes/string.rb",
             "parser/nodes/message_receiver.rb", "parser/nodes/method_definition.rb", "parser/nodes/subexpression.rb",
             "parser/nodes/catch.rb", "parser/nodes/identifier.rb", "parser/nodes/ensure.rb", "parser/nodes/operator_message.rb",
             "parser/nodes/return.rb", "parser/nodes/yield.rb", "parser/nodes/class_method_definition.rb", "parser/nodes/super_call.rb",
             "parser/nodes/methodcall.rb", "parser/nodes/message_with_params.rb"]
  s.bindir = "bin"
  s.executables = ["blocktalk"]
  s.require_path = ''
  s.has_rdoc = false
  s.add_dependency "treetop"
end

