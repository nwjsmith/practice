class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each { |item| update(item) }
  end

  private

  module Updater
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

    class NormalUpdater
      attr_reader :item

      def initialize(item)
        @item = item
      end

      def update
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

    NAME_TO_UPDATER = {
      "Aged Brie" => AgedBrieUpdater,
      "Backstage passes to a TAFKAL80ETC concert" => BackstagePassesUpdater,
      "Sulfuras, Hand of Ragnaros" => SulfurasUpdater
    }

    def self.for(item)
      NAME_TO_UPDATER.fetch(item.name, NormalUpdater).new(item)
    end
  end

  def update(item)
    Updater.for(item).update
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