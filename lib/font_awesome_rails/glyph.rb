module FontAwesomeRails
  class Glyph
    attr_accessor :font, :name

    def initialize(font, name)
      @font = font
      @name = name
    end

    def icon
      Icon.new(name)
    end

    def attribute(attribute_name, selector=nil)
      selector ||= "glyph[unicode=#{icon.to_unicode}]"
      font.select(selector)[attribute_name]
    end

    def width
      result = attribute("horiz-adv-x") || attribute("horiz-adv-x", "font")
      result.to_i
    end

    def height
      attribute("units-per-em", "font-face").to_i
    end

    def ascent
      attribute("ascent", "font-face").to_i
    end

    def path
      attribute("d")
    end

    def offset_x
      (width - height) / 2.0
    end

    def offset_y
      -(ascent + height) / 2.0
    end

    def to_svg(path_style=nil)
      path_style ||= default_path_style

      Nokogiri::XML::Builder.new do |xml|
        xml.svg svg_attributes do
          xml.path path_attributes.merge(style: path_style)
        end
      end.to_xml(save_with: Nokogiri::XML::Node::SaveOptions::AS_XML | Nokogiri::XML::Node::SaveOptions::NO_DECLARATION).strip
    end

    def to_uri
      "data:image/svg+xml,#{URI.escape(to_svg)}"
    end

    protected

    def view_box
      "#{offset_x} #{offset_y} #{height} #{height}"
    end

    def svg_attributes
      {
        xmlns: "http://www.w3.org/2000/svg",
        version: "1.1",
        width: "100px",
        height: "100px",
        viewBox: view_box
      }
    end

    def path_attributes
      {
        d: path,
        transform: "rotate(180) scale(-1,1)"
      }
    end

    def default_path_style
      "fill:black"
    end
  end
end
