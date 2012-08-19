require 'singleton'

module FontAwesome
  class Font
    include Singleton

    ASCENT = 1569
    DESCENT = -430

    def ascent
      ASCENT
    end

    def descent
      DESCENT
    end

    def em_size
      attribute("units-per-em", "font-face").to_i
    end

    def character_width(hex_code)
      (attribute("horiz-adv-x", glyph(hex_code)) || attribute("horiz-adv-x", "font")).to_i
    end

    def character_outline(hex_code)
      attribute("d", glyph(hex_code))
    end

    protected

    def glyph(hex_code)
      "glyph[unicode=#{hex_code.to_unicode}]"
    end

    def attribute(attribute_name, selector)
      select(selector)[attribute_name]
    end

    def select(selector)
      svg.at_css(selector)
    end

    def svg
      @svg ||= File.open(path) {|file| Nokogiri.XML(file)}
    end

    def path
      File.expand_path "../../vendor/assets/font/fontawesome-webfont.svg", File.dirname(__FILE__)
    end
  end
end
