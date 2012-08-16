require 'singleton'

module FontAwesomeRails
  class Font
    include Singleton

    def glyph(name)
      Glyph.new self, name
    end

    def select(*rules)
      svg.at_css(*rules)
    end

    def svg
      @svg ||= File.open(path) {|file| Nokogiri.XML(file)}
    end

    def path
      File.expand_path "vendor/assets/font/fontawesome-webfont.svg", FontAwesomeRails.root
    end
  end
end
