module SpudVideosHelper

	def spud_video(set_or_identifier,options = {})
		height = options[:height] || Spud::Videos.default_dimensions[1]
		width  = options[:width]  || Spud::Videos.default_dimensions[0]

    if set_or_identifier.is_a?(SpudVideo)
      video = set_or_identifier
    else
      video = SpudVideo.find_by_identifier(set_or_identifier)
    end

		if video.source == 'youtube'
			extracted_video_id = video.embed_link.gsub(/h?t?t?p?\:?\/?\/?w?w?w?\.?youtu\.be\//,"").gsub("http://www.youtube.com/watch?v=","")
			source = "http://www.youtube.com/embed/#{extracted_video_id}"
			content = "<iframe width='#{width}' height='#{height}' src='#{source}' frameborder='0' allowfullscreen></iframe>"
			return content.html_safe
		elsif video.source == 'vimeo'
			extracted_video_id = video.embed_link.gsub(/h?t?t?p?\:?\/?\/?vimeo.com\//,"")
			source = "http://player.vimeo.com/video/#{extracted_video_id}?title=0&amp;byline=0&amp;portrait=0"
			content = "<iframe src='#{source}' width='#{width}' height='#{height}' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>"
			return content.html_safe
		end
	end
end
