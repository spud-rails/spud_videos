class Spud::Admin::VideosController < Spud::Admin::ApplicationController
	belongs_to_spud_app :videos
	layout 'spud/admin/detail'
	before_filter :load_video,:only => [:edit,:update,:show,:destroy]

	def index
		@videos = SpudVideo.order(:video_order).paginate :page => params[:page]
		respond_with @videos
	end

	def new
		last_video = SpudVideo.order("video_order DESC").first

		@video = SpudVideo.new(:video_order => 0)
		if !last_video.blank? && last_video.video_order != nil
			@video.video_order = last_video.video_order + 1
		end
		respond_with @video
	end

	def create
		@video = SpudVideo.new(params[:spud_video])
		if @video.save
			flash[:notice] = "Video Saved successfully!"
		else
			flash[:error] = "Error saving video"
		end
		respond_with @video,:location => spud_admin_videos_url
	end

	def edit
		respond_with @video
	end

	def update

		if @video.update_attributes(params[:spud_video])
			flash[:notice] = "Video Saved successfully!"
		else
			flash[:error] = "Error saving video"
		end
		respond_with @video,:location => spud_admin_videos_url
	end

	def destroy
		if @video.destroy
			flash[:notice] = "Video successfully removed"
		end
		respond_with @video
	end

	def reorder
	end

private
	def load_video
		@video = SpudVideo.find(params[:id])
		if @video.blank?
			flash[:error] = "Video not found!"
			redirect_to spud_admin_videos_url and return
		end
	end	
end
