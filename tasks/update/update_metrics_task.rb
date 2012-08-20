require_relative "../task"
require_relative "metrics"

class UpdateMetricsTask < Task
  def run
    puts "* Updating #{font_class_path}"

    source = updated_font_class
    open_file(font_class_path, "w") do |file|
      file.write source
    end
  end

  def updated_font_class
    font_class.sub(/ASCENT = \d+/, "ASCENT = #{Metrics.ascent}").sub(/DESCENT = -\d+/, "DESCENT = #{Metrics.descent}")
  end

  def font_class
    open_file(font_class_path)
  end

  def font_class_path
    "lib/font_awesome/font.rb"
  end
end
