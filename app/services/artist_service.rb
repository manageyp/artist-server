# -*- encoding : utf-8 -*-

class ArtistService

  class << self

    def fetch_by_mobile(mobile)
      Artist.where(mobile: mobile).first
    end

    def create_artist(mobile, password)
      Artist.build(mobile, password)
    end

  end

end