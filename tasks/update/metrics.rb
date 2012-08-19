require "font_awesome"
require "RMagick"

module Metrics
  extend self

  def ascent
    Ascent.new.actual_height
  end

  def descent
    -Descent.new.actual_height
  end

  class Image < FontAwesome::Icon
    def initialize
      super(nil)
    end

    def actual_height
      to_image.trim.rows
    end

    def to_image
      Magick::Image.from_blob(to_svg){self.format = "svg"}.first
    end

    protected

    def build_svg(xml)
      xml.svg svg_attributes do
        FontAwesome::Icon.all.each do |icon|
          xml.path icon.path_attributes
        end
      end
    end

    def svg_attributes
      super.merge(width:"2048px", height:"2048px")
    end

    def offset_x
      0
    end
  end

  class Ascent < Image
    protected

    def offset_y
      2048
    end
  end

  class Descent < Image
    protected

    def offset_y
      0
    end
  end
end
