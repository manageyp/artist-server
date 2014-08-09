class UsersController < ApplicationController
  before_filter :config_userpage

  def login
  end

  def do_login
  end

  def logout
  end

  def register
  end

  def do_register

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
