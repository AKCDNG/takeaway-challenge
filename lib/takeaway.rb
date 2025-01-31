require_relative "dishes"
require_relative "text"

class Takeaway

  def initialize(dishes = Dishes.new, text = Text.new)
    @order = []
    @dishes = dishes
    @order_total = 0
    @text = text
  end

  def order_dishes(dish, quantity = 1)
    quantity.times { search_menu(dish) }
  end

  def show_order
    @order
  end

  def show_menu
    @dishes.show_menu
  end

  def order_total
    calculate_total
  end

  def place_order
    fail "Cannot complete order. Nothing has been ordered." if order_empty?
    @text.send_text
  end

  private

  def search_menu(dish)
    @dishes.show_menu.each do |dish_name| 
      @order.push(dish_name) if dish == dish_name[:name]
    end
  end

  def calculate_total
    @order_total = 0
    @order.each do |dish|
      @order_total += dish[:price]
    end
    @order_total
  end

  def order_empty?
    @order.empty?
  end

end
