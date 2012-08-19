module FontAwesome
  class Icon
    attr_accessor :style
    attr_reader :hex_code, :font

    def initialize(name)
      @hex_code = HexCode.new(name)
      @font = Font.instance
      @style = default_style
    end

    def name
      hex_code.name
    end

    def to_svg
      Nokogiri::XML::Builder.new do |xml|
        build_svg(xml)
      end.to_xml(save_with: Nokogiri::XML::Node::SaveOptions::AS_XML | Nokogiri::XML::Node::SaveOptions::NO_DECLARATION).strip
    end

    def to_uri
      "data:image/svg+xml,#{URI.escape(to_svg)}"
    end

    def self.all
      HexCode.all.map {|name, code| new name }
    end

    protected

    def default_style
      "fill:black"
    end

    def view_box
      "#{-offset_x} #{-offset_y} #{font.em_size} #{font.em_size}"
    end

    def offset_x
      (font.em_size - width) / 2.0
    end

    def offset_y
      font.ascent
    end

    def width
      font.character_width(hex_code)
    end

    def path
      font.character_outline(hex_code)
    end

    def build_svg(xml)
      xml.svg svg_attributes do
        xml.path path_attributes
      end
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
        style: style,
        transform: "rotate(180) scale(-1,1)"
      }
    end
  end
end
