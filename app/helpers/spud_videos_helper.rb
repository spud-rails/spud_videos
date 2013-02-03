require 'cgi'
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
    elsif video.source == 'brightcove'
      parameters = CGI::parse(video.embed_link)
      content="<!-- Start of Brightcove Player -->
        <div style=\"display: none;\"></div>
        <!-- By use of this code snippet, I agree to the Brightcove Publisher T and C  found at https://accounts.brightcove.com/en/terms-and-conditions/.  -->
        <p><script language=\"JavaScript\" type=\"text/javascript\" src=\"http://admin.brightcove.com/js/BrightcoveExperiences.js\"></script> <object id=\"myExperience2124779161001\" class=\"BrightcoveExperience\">
          <param name=\"bgcolor\" value=\"#FFFFFF\" />
          <param name=\"width\" value=\"#{width}\" />
          <param name=\"height\" value=\"#{height}\" />

          <param name=\"isVid\" value=\"true\" />
          <param name=\"isUI\" value=\"true\" />
          <param name=\"dynamicStreaming\" value=\"true\" />
        "
        parameters.each do |key,value|
          content += "<param name=\"#{key}\" value=\"#{value}\" />"
        end
        content += "</object></p>
        <!--  This script tag will cause the Brightcove Players defined above it to be created as soon as the line is read by the browser. If you wish to have the player instantiated only after the rest of the HTML is processed and the page load is complete, remove the line. -->
        "

        return content.html_safe
		end
	end
end
