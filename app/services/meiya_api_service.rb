# encoding: utf-8

class MeiyaApiService

  include MeiyaApiConfig

  class << self

    def do_get(url, params)
      RestClient.get url, {params: params}
    end

    def do_post(url, params)
      RestClient.post url, params
    end

    def do_put(url, params)
      RestClient.put url, params
    end

    def do_delete(url, params)
      RestClient.delete url, params
    end

    def parse_content(content)
      result = JSON.parse(content)
      if result.present?
        if result.has_key?('result') && result.has_key?('message')
          [false, result['message']]
        else
          result
        end
      end
    end

    def artist_login(login, password)
      content = do_post(ARTIST_LOGIN, {login: login, password: password})
      parse_content(content)
    end

    def artist_register(login, password, rand)
      content = do_post(ARTIST_REGISTER,
        {login: login, password: password, rand: rand})
      parse_content(content)
    end

    def captcha_send(mobile)
      content = do_post(CAPTCHA_SEND, {mobile: mobile})
      parse_content(content)
    end

  end

end
