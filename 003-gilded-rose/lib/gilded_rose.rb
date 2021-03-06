class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&method(:update_item))
  end

  private

  def update_item(item)
    if item.name == "Sulfuras, Hand of Ragnaros"
      nil
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      item.sell_in = item.sell_in - 1
      if item.quality < 50
        item.quality = item.quality + 1
        if item.sell_in < 11
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
        if item.sell_in < 6
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
      if item.sell_in < 0
        item.quality = item.quality - item.quality
      end
      nil
    elsif item.name == "Aged Brie"
      item.sell_in = item.sell_in - 1
      if item.quality < 50
        item.quality = item.quality + 1
      end
      if item.sell_in < 0
        if item.quality < 50
          item.quality = item.quality + 1
        end
      end
      nil
    else
      item.sell_in = item.sell_in - 1
      if item.quality > 0
        item.quality = item.quality - 1
      end
      if item.sell_in < 0
        if item.quality > 0
          item.quality = item.quality - 1
        end
      end
      nil
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end