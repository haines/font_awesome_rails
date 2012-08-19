module GemDir
  extend self

  def expand_path(relative_path)
    File.expand_path("../#{relative_path}", File.dirname(__FILE__))
  end

  def open_file(relative_path, mode="r", &block)
    File.open(expand_path(relative_path), mode, &block)
  end
end
