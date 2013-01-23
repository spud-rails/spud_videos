require 'spud_core'
require 'liquid'
module Spud
	module Videos
		class Engine < ::Rails::Engine
			engine_name "spud_videos"
			initializer :admin do
				Spud::Core.configure do |config|
				  config.admin_applications += [{:name => "Videos",:thumbnail => "spud/admin/videos_thumb.png",:url => "/spud/admin/videos",:order => 6,:retina => true}]
				end
			end

      initializer :liquid do
        Liquid::Template.register_tag('video', Spud::Videos::VideoTag) if defined?(Liquid::Template)
      end
		end
	end
end
