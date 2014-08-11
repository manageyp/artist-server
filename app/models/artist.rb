class Artist < ActiveRecord::Base
  has_one :artist_profile
  has_one :artist_avatar

  class << self

    def build(mobile, password)
      create(mobile: mobile, password: password)
    end

  end

end
