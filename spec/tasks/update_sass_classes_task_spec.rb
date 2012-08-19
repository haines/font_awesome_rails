require "spec_helper"

describe UpdateSassClassesTask do
  subject(:task) { UpdateSassClassesTask.new }

  def mock_icon(name, hex_code)
    stub(name: name, hex_code: stub(to_css: "\\#{hex_code}"))
  end

  describe "#run" do
    it "writes css classes for legacy styling" do
      task.stubs(:puts)
      FontAwesome::Icon.stubs(:all).returns([mock_icon("pizza", "f00d"), mock_icon("linux", "f055")])
      task.expects(:open_file).with("app/assets/stylesheets/font-awesome/_icon-classes.scss", "w").yields(mock{expects(:write).with(".icon-pizza:before { @extend %icon-pizza; }\n.icon-linux:before { @extend %icon-linux; }\n")})
      task.run
    end
  end
end
