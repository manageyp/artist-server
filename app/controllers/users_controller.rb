class UsersController < ApplicationController
  before_filter :config_userpage

  def login
  end

  def do_login
    # "username"=>"15026612137", "password"=>"[FILTERED]"
    result, @message = MeiyaApiService.artist_login(params[:username],
        params[:password])
    if result
      session[:artist_id] = result["id"]
      redirect_to artists_path and return
    else
      render action: 'login' and return
    end
  end

  def logout
    session[:artist_id] = nil
  end

  def register
  end

  def do_register
    # "mobile"=>"15026612137", "password"=>"[FILTERED]",
    # "captcha"=>"1232", "user_terms"=>"on"
    result, @message = MeiyaApiService.artist_register(params[:mobile],
      params[:password], params[:captcha])
    if result
      session[:artist_id] = result["id"]
      redirect_to artists_path and return
    else
      render action: 'register' and return
    end
  end

  def forget_password
  end

  def do_forget_password
  end

  def reset_password
  end

  def send_captcha
    # "mobile"=>"15026612137"
    result, @message = MeiyaApiService.captcha_send(params[:mobile])
    if result
      render text: "success" and return
    else
      render text: @message, status: 403 and return
    end
  end

  private
  def config_userpage
    @home_page = true
  end
end
