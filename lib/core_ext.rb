module Enumerable
  def count_by
    counts = Hash.new { |hash, key| hash[key] = 0 }

    each do |item|
      counts[yield(item)] += 1
    end

    counts
  end
end
