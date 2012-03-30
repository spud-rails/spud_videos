module Spud
  module Videos
    include ActiveSupport::Configurable

    config_accessor :base_layout,:enable_videos_route

    self.base_layout = "application"
    self.enable_videos_route = true

  end
end