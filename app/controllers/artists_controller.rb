class ArtistsController < ApplicationController
  before_filter :auth_login

  def index
    @image_url = session[:artist_avatar]
  end

  def upload_avatar
    xposition = params[:xposition]
    yposition = params[:yposition]
    width = params[:avatar_width]

    image = MiniMagick::Image.read(params[:image].read)
    file_name = "/uploads/avatars/#{Time.now.to_i}.#{image_format(image.mime_type)}"
    save_path = "#{Rails.root}/public#{file_name}"
    crop_params = "#{width}x#{width}+#{xposition}+#{yposition}"
    image.crop(crop_params)
    image.write(save_path){self.quality=90}

    @image_url = file_name
    session[:artist_avatar] = file_name
    render action: 'index'
  end

  private

  def image_format(mime_type)
    case mime_type
    when 'image/jpeg'
      'jpeg'
    when 'image/jpg'
      'jpg'
    when 'image/png'
      'png'
    else
      'jpg'
    end
  end

end