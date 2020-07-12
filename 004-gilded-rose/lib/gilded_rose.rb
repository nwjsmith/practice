class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each(&method(:update))
    self
  end

  private

  def update(item)
    if item.name == "Sulfuras, Hand of Ragnaros"
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      update_backstage_passes(item)
    elsif item.name == "Aged Brie"
      update_aged_brie(item)
    else
      if item.quality > 0
        item.quality = item.quality - 1
      end
      item.sell_in = item.sell_in - 1
      if item.sell_in < 0
        if item.quality > 0
          item.quality = item.quality - 1
        end
      end
    end
    nil
  end

  def update_aged_brie(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0
      if item.quality < 50
        item.quality = item.quality + 1
      end
    end
  end

  def update_backstage_passes(item)
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
    item.sell_in = item.sell_in - 1
    if item.sell_in < 0
      item.quality = item.quality - item.quality
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