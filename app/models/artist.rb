class Artist < ActiveRecord::Base
  has_one :artist_profile

  class << self

    def build(mobile, password)
      create(mobile: mobile, password: password)
    end

  end

end
