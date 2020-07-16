class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each { |item| update(item) }
  end

  private

  class AgedBrieUpdater
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def update
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
  end

  class BackstagePassesUpdater
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def update
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
      nil
    end
  end

  class SulfurasUpdater
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def update
      nil
    end
  end

  def update(item)
    if item.name == "Aged Brie"
      AgedBrieUpdater.new(item).update
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      BackstagePassesUpdater.new(item).update
    elsif item.name == "Sulfuras, Hand of Ragnaros"
      nil
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

  def to_s()
    "#{name}, #{sell_in}, #{quality}"
  end
end