require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @session_cookie = {}
    if req.cookies["_rails_lite_app"] 
      pair = JSON.parse(req.cookies["_rails_lite_app"])
      key =  pair.keys[0]
      val =  pair[key]
      @session_cookie[key] = val
    end
  end

  def [](key)
    @session_cookie[key]
  end

  def []=(key, val)
    @session_cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie("_rails_lite_app", {value: @session_cookie.to_json, path: '/'})
  end
end
