namespace :update do

  desc "Generate FontAwesome::HexCode.HEX_CODES"
  task :hex_codes => "font_awesome:download" do
    require_relative "update_hex_codes_task"
    UpdateHexCodesTask.new.run
  end

end
