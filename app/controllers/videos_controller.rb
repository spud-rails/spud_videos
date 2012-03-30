class VideosController < ApplicationController

	def index
		@videos = SpudVideo.order(:video_order).all
	end

end
