class VideosController < ApplicationController
	layout Spud::Videos.base_layout
	def index
		@videos = SpudVideo.order(:video_order).all
	end

end
