require "spec_helper"

describe UpdateSassPlaceholdersTask do
  subject(:task) { UpdateSassPlaceholdersTask.new }

  def mock_icon(name, hex_code)
    stub(name: name, hex_code: stub(to_css: "\\#{hex_code}"))
  end

  describe "#run" do
    it "writes scss placeholders for icon content" do
      task.stubs(:puts)
      FontAwesome::Icon.stubs(:all).returns([mock_icon("pizza", "f00d"), mock_icon("linux", "f055")])
      task.expects(:open_file).with("app/assets/stylesheets/font-awesome/_icon-placeholders.scss", "w").yields(mock{expects(:write).with("%icon-pizza { content: '\\f00d'; }\n%icon-linux { content: '\\f055'; }\n")})
      task.run
    end
  end
end
