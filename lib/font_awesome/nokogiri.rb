module FontAwesome
  module Nokogiri
    extend self

    def raise_exception
      raise LoadError, %{Nokogiri is required to use this feature -- please add "gem 'nokogiri'" to your Gemfile and run "bundle install"}
    end

    def method_missing(method, *args)
      raise_exception
    end

    def const_missing(const)
      raise_exception
    end
  end
end
