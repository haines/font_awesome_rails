require 'active_support/concern'

module FontAwesomeRails
  module SassExtensions
    module Functions
      extend ActiveSupport::Concern

      included do
        declare :icon_image, [:name]
        declare :icon_image, [:name, :style]
      end

      def icon_image(name, style=nil)
        assert_type name, :String

        unless style.nil?
          assert_type style, :String
          style = style.value
        end

        Sass::Script::String.new Glyph.new(name.value, style).to_uri, :string
      end
    end
  end
end
