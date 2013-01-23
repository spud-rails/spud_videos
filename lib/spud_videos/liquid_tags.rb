require 'liquid'
require 'csv'
require_relative '../../app/helpers/spud_videos_helper'

module Spud
  module Videos
    class VideoTag < Liquid::Tag

      include Sprockets::Helpers::RailsHelper
      include Sprockets::Helpers::IsolatedHelper
      include ActionView::Helpers
      include ActionView::Context
      include SpudVideosHelper

      def initialize(tag_name, params, tokens)
        @params = parse_params params
        @video = SpudVideo.find_by_identifier(@params[0])
      end

      def parse_params(params)
        CSV.parse_line params, {:col_sep => ' '}
      end

      def tag_name
        return 'video'
      end

      def tag_value
        return @video.name
      end

      def render(context)
        options = {}
        @params[1..-1].each do |param|
          if !param.blank?
            args = param.to_s.split("=")
            if args[0].downcase == 'width'
              options[:width] = args[1]
            elsif args[0].downcase == 'height'
              options[:height] = args[1]
            end
          end


        end
        return spud_video(@video,options)
      end

    end
  end
end
