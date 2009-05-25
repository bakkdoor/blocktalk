# require 'message-lang-spec.msg'
require "message-lang-spec"

File open: "test.txt" mode: "w" do |f|
  # write three lines to 'test.txt' and close afterwards (done in File#open)
  f puts: "what's up, dog?!"
  f puts: "crazy shit, yo!"
  f puts: "hahaha!!"
end

# print:
# 10
# 9
# 8
# ..
# 0
# to Console:
10 to 0 do |i|
  Console puts: i
end

# same again
i = 0
(i < 10) while_true do |i|
  Console puts: i
  i incr # increment i
  # or:
  i ++
end
