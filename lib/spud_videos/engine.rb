require 'spud_core'
module Spud
	module Videos
		class Engine < ::Rails::Engine
			engine_name "spud_videos"
			initializer :admin do
				Spud::Core.configure do |config|
				  config.admin_applications += [{:name => "Videos",:thumbnail => "spud/admin/videos_thumb.png",:url => "/spud/admin/videos",:order => 6}]
				end
			end
		end
	end
end
