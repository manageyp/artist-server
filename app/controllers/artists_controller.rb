class ArtistsController < ApplicationController
  before_filter :auth_login

  def index
  end

  def upload_avatar
    avatar = params[:image]
    xposition = params[:xposition]
    yposition = params[:yposition]
    avatar_width = params[:avatar_width]

    render action: 'index'
  end

end