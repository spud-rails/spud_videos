require 'liquid'
require_relative '../../app/helpers/videos_helper'

module Spud
  module Videos
    class VideoTag < Liquid::Tag

      include Sprockets::Helpers::RailsHelper
      include Sprockets::Helpers::IsolatedHelper
      include ActionView::Helpers
      include ActionView::Context
      include SpudVideosHelper

      def initialize(tag_name, set_identifer, tokens)
        @video = SpudVideo.find_by_identifier(set_identifer)
      end

      def tag_name
        return 'video'
      end

      def tag_value
        return @video.name
      end

      def render(context)
        puts tokens
        return spud_video(@video)
      end

    end
  end
end
