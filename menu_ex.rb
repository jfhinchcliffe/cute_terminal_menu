
total_cost = 0
total_order = Hash.new
menu_items = {"pork" => 20, "crab" => 12, "noodle" => 4, "long pig" => 200}
def menu
  exit = false

  until exit
    puts "Total cost is currently $#{total_cost}"
    puts "🍖 🍖 🍖  Please make a selection: 🍖 🍖 🍖 "
    puts "1. See the menu 📔 "
    puts "2. Choose an item 🍲 🍛 🍜 "
    puts "3. Check order 📖  "
    puts "4. Pay up 💳 "
    puts "5. Exit the program"
    page_divide
    selection = $stdin.gets.chomp
    case selection
    when "1"
      display_menu
    when "2"
      choose_item
    when "3"
      check_order
    when "4"
      pay_up
    when "5"
      puts "👋 👋 👋 👋 👋 Later!👋 👋 👋 👋 👋"
      page_divide
      exit = true
    end
  end

end

def display_menu
  page_divide
  menu_items.each do |name, price|
    puts "#{name} costs $#{price}"
  end
  page_divide
end

def choose_item
  page_divide
  display_menu
  puts "Please type in the name of the item:"
  food_choice = $stdin.gets.chomp
  current_cost = total_cost
  menu_items.each do |name, price|
    if food_choice.downcase == name
      total_cost += price
      #default value for Hash
      total_order[name] ? total_order[name] += 1 : total_order[name] = 1
      puts "#{name} ordered for $#{price}!"
    end
  end
  if current_cost == total_cost
    puts "Sorry, item not found! 😞 "
  end
  page_divide
end

def page_divide
  puts "#" * 20
end

def pay_up
  puts "💰💰💰 You whip out your card and pay $#{total_cost} 💰💰💰"
  total_cost = 0
  page_divide
end

def check_order
  page_divide
  puts "Your order thus far:"
  total_order.each do |name, amount|
    puts "#{amount} X #{name}"
  end
  page_divide
end


menu
