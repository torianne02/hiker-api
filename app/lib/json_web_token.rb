class JsonWebToken
  # secret to encode and decode token
  HMAC_SECRET = Rails.application.secrets.secret_key_base
  
  def self.encode(payload, exp = 24.hours.from_now)
    # set expiry to 24 hrs from time created
    payload[:exp] = exp.to_i

    # sign token with app secret
    JWT.encode(payload, HMAC_SECRET)
  end 

  def self.decode(token)
    # get payload; first i in decoded arr
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body

    # rescue from all decode errors
  rescue JWT::DecodeError => e 
    # raise custom error
    raise ExceptionHandler::InvalidToken, e.message
  end
end