
class Foo
  def hi
    "Hola"
  end
end



module Baz
  def chau
    "Chau"
  end

  def load_message
    @message = "Hello from Baz"
  end
end

class Bar < Foo
  class FooBar
    def sarasa
    end
  end

  include Baz

  def hi
    load_message
    @message
  end
end

module ActiveRecord
  class Base
  end
end

class ActiveRecord
  class Base
  end
end

puts Foo.new.hi
puts Bar.new.hi
puts Bar.new.chau

bar = Bar.new

bar.kind_of?(Baz)
bar.kind_of?(Foo)
bar.kind_of?(Bar)

bar.hi

puts bar.instance_variable_get("@message")

class FooBar
  include Enumerable

  def each(&block)
    (1..10).each(&block)
  end
end

i = FooBar.new

# i.each do |value|
  # puts value
# end

puts i.map { |value| value * 2 }.inspect
