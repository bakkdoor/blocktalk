$gemspec = Gem::Specification.new do |s|
  s.name = "blocktalk"
  s.version = "0.1.1"
  s.author = "Christopher Bertels"
  s.email = "bakkdoor@flasht.de"
  s.homepage = "http://www.adztec-independent.de"
  s.platform = Gem::Platform::RUBY
  s.summary = "Blocktalk is a dynamic, object-oriented programming language somewhat in the tradition of Smalltalk and Ruby."
  s.files = ["README.markdown", "benchmark.bt", "TODO", "{lib,bin,examples,language-spec,parser}/**/*"].map{|p| Dir[p]}.flatten
  s.bindir = "bin"
  s.executables = ["blocktalk"]
  s.has_rdoc = false
  s.add_dependency "treetop"
end

