@menu = {
  sections: [
    {name:"Tacos", description:"Freshly Made Blue Corn Tortillas", items:[
      {name:"Al pastor", description:"pork, achiote, pineapple", price:3.50},
      {name:"Carnitas", description:"pork, orange, cinnamon", price:3.50},
      {name:"Chorizo", description:"pork, paprika, cumin, garlic", price:3.50},
      {name:"Asada", description:"pork, paprika, cumin, garlic", price:5.00},
      {name:"Barbacoa", description:"beef, cumin, pasilla negra", price:3.50},
      {name:"Lengua", description:"beef, tongue, cerveza victoria", price:3.50},
      {name:"Pollo", description:"chicken, scallion, cilantro", price:3.50},
      {name:"Camaron", description:"shrimp, red 'mole', slaw", price:5.00},
      {name:"Huitlacoche", description:"corn, truffle, scallion", price:3.50},
      {name:"Rajas", description:"poblano, onion, crema, cotija", price:3.50},
      {name:"Chapulines", description:"grasshoppers, avocado, tajin", price:3.50}
    ]}, #<--Tacos Hash
    {name:"Sides/antojitos", items:[
      {name:"Totopos with no add ons", description:"hand torn blue masa chips", price:5.00},
      {name:"Totopos with guac", description:"hand torn blue masa chips with guac", price:7.00},
      {name:"Totopos with frijoles", description:"hand torn blue masa chips with frijoles", price:7.00},
      {name:"Totopos with salsa", description:"hand torn blue masa chips with salsa", price:6.50},
      {name:"Elote", description:"charred corn, cilantro-jalapeno crema, cotija", price:5.00},
      {name:"Quinoa", description:"jicama, corn, scallion, chile, nopal dressing", price:6.50}
    ]}, #<--Sides/Antojitos Hash
    {name:"Beer/Cerveza", items:[
      {name:"Corona extra", price:7.00},
      {name:"Corona light", price:6.00},
      {name:"Negra modelo", price:6.00},
      {name:"Pacifico", price:6.00},
      {name:"Tecate", price:5.00},
      {name:"Victoria", price:6.00},
      {name:"Rotating craft selection", price:8.00}
    ]},#<--Beer/Cerveza Hash
    {name:"Breakfast", description: "Everyday 8 AM - 11:30 AM", items:[
      {name:"Huevos a la mexicana", description:"scrambled eggs, pico, frijoles, crema, tortillas", price:5.00},
      {name:"Quesadillas de epazote", description:"queso chihuahua, cotija, epazote, pico, frijoles", price:5.00},
      {name:"Tostada de aguacate", description:"avocado, egg, frijoles, cabbage, cotija", price:6.00},
      {name:"Chilaquiles", description:"crispy masa, pollo, salsa roja, eggs, crema", price:6.00},
      {name:"Tortilla de aguacate", description:"avocado, queso chihuahua, cotija, frijoles", price:6.00}
    ]},#<--Breakfast Hash
    {name:"Coffee & Tea", items:[
      {name:"Espresso shot", description:"a shot of espresso",price:3.00},
      {name:"Espresso cortado", description: "an espresso cortado",price:4.00},
      {name:"Espresso latte", description: "an espresso latte",price:5.00},
      {name:"La endulzada", description:"espresso, condensed milk, ice, shaken", price:5.00},
      {name:"Green tea", description:"Jasmine Cloud by JoJo Tea", price:3.00},
      {name:"Orange juice", description:"fresh squeezed florida OJ", price:5.00}
    ]}#<--Coffee & Tea Hash
  ]
}

#screens-----------------------------------------------------------------------
how_may_i_help_you = "\nTaquiza Tacos, what\'ll it be?"

show_or_place = "\nShow menu, place order, or cancel order?"

what_menu_section = "\nWhat are you in the mood for?\n\nTacos\nSides/Antojitos\nBeer/Cerveza\nBreakfast\nCoffee & Tea\n\n"

what_section_item = "\nWhat would you like from this section?"

what_add_ons = "Would you like any addons?"

get_check_cancel_order = "Would you like to get the check or cancel your order\nGet the check\nCancel order"

anything_else = "Would you like anything else?\nYes\nDone Ordering"

#choices arrays---------------------------------------------------------------
show_or_place_array = ["show menu","place order","cancel order"]

what_menu_section_array = ["tacos","sides/antojitos","beer/cerveza","breakfast","coffee & tea"]

tacos_array = ["al pastor","carnitas","chorizo","asada","barbacoa","lengua","pollo","camaron","huitlacoche","rajas","chapulines"]

sides_antojitos_array = ["totopos with no add ons","totopos with guac","totopos with frijoles","totopos with salsa", "elote", "quinoa"]

beer_cerveza_array = ["corona extra","corona light","negra modelo","pacifico","tecate","victoria","rotating craft selection"]

breakfast_array = ["huevos a la mexicana","quesadillas de epazote","tostada de aguacate","chilaquiles","tortilla de aguacate"]

coffee_tea_array = ["espresso shot","espresso cortado","espresso latte","la endulzada","green tea","orange juice"]

yes_done_ordering_array = ["yes","done ordering"]

get_check_cancel_order_array = ["get the check","cancel order"]
#-----------------------------------------------------------------------------

#------Show menu---------------------------------------------------------------
def show_items
  @menu[:sections].each do |section|
    puts "\n\n\n"
    puts "*"*60
    puts section[:name].capitalize
    puts "*"*60
    puts "\n"
    section[:items].each do |item|
      puts "#{item[:name].capitalize}"
      puts "#{item[:description]}"
      puts "#{item[:price]}"
    end
  end
end
#------------------------------------------------------------------------------
#----Shows whatever section the user selects-----------------------------------
def show_section(section_index)
  puts "*"*60
  @menu[:sections][section_index][:items].each do |item|
    puts "\n"
    puts "#{item[:name].capitalize}"
    puts "#{item[:description]}"
    puts "#{item[:price]}"
    puts "\n"
  end
end

#------------------------------------------------------------------------------

#------------------------Requests and filters user input-----------------------
def request_user_input(choices_array,screen)
  puts screen
  user_input = gets.chomp.to_s.downcase
  until choices_array.include?(user_input)
    puts screen
    user_input = gets.chomp.to_s.downcase
  end
  return user_input
end
#------------------------------------------------------------------------------

#-Matches items in cart with items in menu array and returns their price-------
def get_item_price(item_name)
  @menu[:sections].each do |section|
    section[:items].each do |item|
      if item[:name] == item_name
        return item[:price]
      end
    end
  end
end
#------------------------------------------------------------------------------

#-Uses subtotal to calculate tax, tip, and total-------------------------------
def calculator
  bill = @sub_total
  puts "What percentage would you like to tip?\n15\n20\nCustom"
  what_tip = gets.chomp.to_s.downcase
  until ["15","20","custom"].include?(what_tip)
    puts "What percentage would you like to tip?\n15\n20\nCustom"
    what_tip = gets.chomp.to_s.downcase
  end
  case what_tip
  when "15"
    @sales_tax = bill * (6.00/100.00)
    total_with_tax = bill + @sales_tax
    @tip = bill *(15.00/100.00)
    total_with_tip = total_with_tax + @tip
    @check_total = "%.2f" % total_with_tip
  when "20"
    @sales_tax = bill * (6.00/100.00)
    total_with_tax = bill + @sales_tax
    @tip = bill *(20.00/100.00)
    total_with_tip = total_with_tax + @tip
    @check_total = "%.2f" % total_with_tip
  when "custom"
    puts "Please type in your desired tip percentage"
    @sales_tax = bill * (6.00/100.00)
    total_with_tax = bill + @sales_tax
    @tip = gets.chomp.to_i/100.00*(bill)
    total_with_tip = total_with_tax + @tip
    @check_total = "%.2f" % total_with_tip
  end
  return @tip
  return @sales_tax
  return @check_total
end
#------------------------------------------------------------------------------

loop do
  puts how_may_i_help_you
  result = request_user_input(show_or_place_array,show_or_place)
  case result
  when "show menu"
    show_items
  when "place order"
    @order = []
    loop do
      result = request_user_input(what_menu_section_array,what_menu_section)
      case result
        when "tacos"
          show_section(0)
          result = request_user_input(tacos_array,what_section_item)
          if tacos_array.include?(result)
            @order << result
          end
          done_ordering_result = request_user_input(yes_done_ordering_array,anything_else)
        when "sides/antojitos"
          show_section(1)
          result = request_user_input(sides_antojitos_array,what_section_item)
          if sides_antojitos_array.include?(result)
            @order << result
          end
          done_ordering_result = request_user_input(yes_done_ordering_array,anything_else)
        when "beer/cerveza"
          show_section(2)
          result = request_user_input(beer_cerveza_array,what_section_item)
          if beer_cerveza_array.include?(result)
            @order << result
          end
          done_ordering_result = request_user_input(yes_done_ordering_array,anything_else)
        when "breakfast"
          show_section(3)
          result = request_user_input(breakfast_array,what_section_item)
          if breakfast_array.include?(result)
            @order << result
          end
          done_ordering_result = request_user_input(yes_done_ordering_array,anything_else)
        when "coffee & tea"
          show_section(4)
          result = request_user_input(coffee_tea_array,what_section_item)
          if coffee_tea_array.include?(result)
            @order << result
          end
          done_ordering_result = request_user_input(yes_done_ordering_array,anything_else)
      end
      break if done_ordering_result == "done ordering"
    end
    result = request_user_input(get_check_cancel_order_array,get_check_cancel_order)
    case result
    when "get the check"
      puts "\n\n"
      puts "*"*60
      puts "Check"
      puts "*"*60
      @order.each do |item|
        puts "Name: #{item.capitalize}    Price: #{"%.2f" % get_item_price(item.capitalize)}"
      end
      @total_array = []
      @order.each do |item|
        @total_array << get_item_price(item.capitalize)
      end
      @sub_total = @total_array.sum
      calculator
      puts "Subtotal: #{"%.2f" % @sub_total}"
      puts "Tax: #{"%.2f" % @sales_tax}"
      puts "Tip: #{"%.2f" % @tip}"
      puts "Check Total: #{@check_total}"
      puts "*"*60
      puts "\n\n"
    when "cancel order"
      break
    end
    break
  when "cancel order"
    break
  end
end
