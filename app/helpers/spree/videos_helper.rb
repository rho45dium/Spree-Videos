module Spree
  module VideosHelper
    def video_embed_html5(video, opts)
      url_opts = opts[:url_params].empty? ? '' : "?#{Rack::Utils::build_query(opts[:url_params])}"

      <<EDOC
<iframe type="text/html" width="#{opts[:width]}" height="#{opts[:height]}" src="https://www.youtube.com/embed/#{video.youtube_ref}#{url_opts}" frameborder="0">
</iframe>
EDOC
    end
  end
end