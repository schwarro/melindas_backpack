class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    # Ensure appropriate clothing is added to backpack
    pack_clothing_based_on_weather

    # Ensure appropriate items (gym shoes, lunch) is added to backpack
    pack_items_based_on_day
  end

  # Prints a summary packing list for Melinda's backpack
  def summary
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

  def pack_usual_clothing
    @items << 'pants'
    @items << 'shirt'
  end

  def pack_clothing_based_on_weather
    weather = @attributes[:weather]
    pack_usual_clothing
    if weather == 'rainy'
      @items << 'umbrella'
    elsif weather == 'cold'
      @items << 'jacket'
    end
  end

  def pack_items_based_on_day
    # Ensure gym shoes are added to backpack if it's a gym day
    check_gym_day
    # Bring a packed lunch on all weekdays
    check_lunch_for_weekdays
  end

  def check_gym_day
    if day_of_week == 'monday' || day_of_week == 'thursday'
      @items << 'gym shoes'
    end
  end

  def check_lunch_for_weekdays
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    end
  end

  def day_of_week
    @attributes[:day_of_week]
  end
end
