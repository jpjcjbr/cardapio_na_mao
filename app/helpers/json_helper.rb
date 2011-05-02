module JsonHelper
  def remove_json_root!
    ActiveRecord::Base.include_root_in_json = false
  end
end
