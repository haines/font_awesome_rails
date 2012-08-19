require 'active_support/concern'

module FontAwesome
  module SassExtensions
    module Functions
      extend ActiveSupport::Concern

      included do
        declare :icon_image, [:name]
        declare :icon_image, [:name, :style]
      end

      def icon_image(name, style=nil)
        assert_type name, :String
        icon = Icon.new(name.value)

        unless style.nil?
          assert_type style, :String
          icon.style = style.value
        end

        Sass::Script::String.new icon.to_uri, :string
      end
    end
  end
end
