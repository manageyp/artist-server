class UsersController < ApplicationController
  before_filter :config_userpage

  def login
  end

  def do_login
    # "username"=>"admin", "password"=>"[FILTERED]"
    user, @message = UserService.login(params)
    if user
      redirect_to artists_path and return
    else
      render action: 'login' and return
    end
  end

  def logout
  end

  def register
  end

  def do_register
    # "mobile"=>"admin", "password"=>"[FILTERED]",
    # "captcha"=>"123", "user_terms"=>"on"
    user, @message = UserService.register(params)
    if user
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
    render text: "success" and return
  end

  private
  def config_userpage
    @home_page = true
  end
end
