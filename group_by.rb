require "pp"

result = (1..10).group_by { |value| value / 3 }

total = result.inject(0) { |accum, (key, all)| accum + all.size }

pp result
pp total
