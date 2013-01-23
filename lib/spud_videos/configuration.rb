module Spud
  module Videos
    include ActiveSupport::Configurable

    config_accessor :base_layout,:enable_videos_route, :default_dimensions

    self.base_layout = "application"
    self.enable_videos_route = true
    self.default_dimensions = [560,315]
  end
end
