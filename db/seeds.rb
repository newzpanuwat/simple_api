puts "Generating..."

restaurant_list = [
    "The Bliss",
    "Manee Mebar",
    "Karate shop",
    "Asimo",
    "Bang",
]

restaurant_list.each_with_index do |name, index|
  puts "creating Restaurant #{name}"
  Restaurant.create(name: name, dish_id: index+1)
end

restaurant_id = Restaurant.limit(5).map(&:id)
dish_list = [
  "Fruit",
  "Pizza",
  "Lasagna",
  "Egg",
  "Chicken fried",
]

dish_list_v2 = [
  "Sausage",
  "Burger",
  "Sushi",
  "Fish",
  "Rice"
]

puts "******************************************"
dish_list.each_with_index do |name, index|
  puts "creating Dishes #{name}"
  dish = Dish.create(name: name, restaurant_id: index+1)
end

dish_list_v2.each_with_index do |name, index|
  puts "creating Dishes #{name}"
  dish = Dish.create(name: name, restaurant_id: index+1)
end

puts "******************************************"
puts "Success!"
