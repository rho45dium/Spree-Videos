module Spree
  class Video < ActiveRecord::Base
    belongs_to :product, :touch => true

    attr_accessible :youtube_ref
    validates_presence_of :youtube_ref
    validates_uniqueness_of :youtube_ref, :scope => [:product_id]
  
    after_validation do
      youtube_ref.match(/(v=|\/)([\w-]+)(&.+)?$/) { |m| self.youtube_ref = m[2] }
    end

    def youtube_data
      Yt::Video.new :id => self.youtube_ref
    end

    def youtube_title
      youtube_data.title
    end

    def youtube_thumbnail_url
      youtube_data.thumbnail_url
    end

    def youtube_published_at
      youtube_data.published_at
    end

    def youtube_description
      youtube_data.description
    end

    def youtube_duration
      youtube_data.duration
    end

    def youtube_view_count
      youtube_data.view_count
    end

    def youtube_comment_count
      youtube_data.comment_count
    end

    def youtube_favorite_count
      youtube_data.favorite_count
    end

  end
end