items = [
  {id: 1, body: 'foo'},
  {id: 2, body: 'bar'},
  {id: 3, body: 'foobar'}
]

p items.map { |item| item[:id] }

# new_array = []
# items.each do |item|
#   new_array << item[:id]
# end

# p new_array
