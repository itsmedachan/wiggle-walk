require './WiggleWalk'

print 'input the number of test cases: '
t = gets.chomp!.to_i
# TODO: validate 1 <= t <= 100
if t == 1
  puts "Let's try #{t} case! (t = #{t})"
else
  puts "Let's try #{t} cases! (t = #{t})"
end

t.times do |case_num|
  puts "----------------- #{case_num+1} --------------------"
  
  print 'input the number of instructions: '
  n = gets.chomp!.to_i
  # TODO: validate 1 <= n =< 100 for test set1
  # TODO: validate 1 <= n =< 5*(10**4) for test set2
  if n == 1
    puts "Let's give #{n} instruction! (n = #{n})"
  else
    puts "Let's give #{n} instructions! (n = #{n})"
  end
  
  print 'input the number of rows: '
  r = gets.chomp!.to_i
  # TODO: validate 1 <= r =< 5*(10**4)
  if r == 1
    puts "Let's set #{r} row! (r = #{r})"
  else
    puts "Let's set #{r} rows! (r = #{r})"
  end
  
  print 'input the number of columns: '
  c = gets.chomp!.to_i
  # TODO: validate 1 <= c =< 5*(10**4)
  if c == 1
    puts "Let's set #{c} column! (c = #{c})"
  else
    puts "Let's set #{c} columns! (c = #{c})"
  end
  
  print 'input which row to start: '
  sr = gets.chomp!.to_i
  # TODO: validate 1 =< sr =< r
  
  print 'input which column to start: '
  sc = gets.chomp!.to_i
  # TODO: validate 1 =< sc =< c
  
  puts "Let's start from (sr, sc) = (#{sr}, #{sc})"
  
  
  ww = WiggleWalk.new(r, c, sr, sc)
  
  directions = ""
  n.times do
    direction = ww.give_instruction
    directions << direction
    # puts direction
    ww.step_to(direction)
    # puts "(#{ww.sr}, #{ww.sc})"
    while ww.have_you_been_here? && ww.right_direction?(direction) do
      # puts direction
      ww.step_to(direction)
      # puts "(#{ww.sr}, #{ww.sc})"
    end
  end
  
  puts "----- Input -----"
  puts "#{n} #{r} #{c} #{sr} #{sc}"
  puts directions
  
  puts "----- Output -----"
  puts "Case ##{case_num+1}: #{ww.sr}, #{ww.sc}"
end