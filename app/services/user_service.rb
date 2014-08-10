# -*- encoding : utf-8 -*-

class UserService

  class << self

    def login(params)
      user = ArtistService.fetch_by_mobile(params[:username])
      if user
        if user.password == params[:password]
          return [user, '登录成功']
        else
          return [false, '密码错误']
        end
      else
        return [false, '手机号码不存在']
      end
    end

    def register(params)
      if CaptchaService.verify(params[:mobile], params[:captcha])
        user = ArtistService.fetch_by_mobile(params[:mobile])
        if user
          return [false, '手机号码已经有用户使用啦']
        else
          user = ArtistService.create_artist(params[:mobile], params[:password])
          return [user, '注册成功']
        end
      else
        return [false, '验证码不正确']
      end
    end

  end

end