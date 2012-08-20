require_relative "../task"

class UpdateHexCodesTask < Task
  def run
    puts "* Updating #{hex_code_class_path}"

    source = updated_hex_code_class
    open_file(hex_code_class_path, "w") do |file|
      file.write source
    end
  end

  def hex_codes
    css.scan(/\.icon-([-a-z]+):before.+content: "\\([a-f\d]+)";/).inject({}) do |result, (name, hex_code)|
      result.merge name => hex_code
    end
  end

  def updated_hex_code_class
    hex_code_class.sub(/HEX_CODES = {[^}]*}/, "HEX_CODES = #{hex_codes}")
  end

  def hex_code_class
    open_file(hex_code_class_path)
  end

  def hex_code_class_path
    "lib/font_awesome/hex_code.rb"
  end

  def css
    open_file("Font-Awesome/css/font-awesome.css")
  end
end
