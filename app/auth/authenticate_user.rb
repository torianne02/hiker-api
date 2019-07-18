class AuthenticateUser
  attr_reader :email, :password

  def initialize(username, password)
    @username = username
    @password = password
  end 

  # service entry point
  def call 
    JsonWebToken.encode(user_id: user.id) if user
  end 

  # verify user credentials
  def user
    user = User.find_by(email: email)

    return user if user && user.authenticate(password)

    # raise error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end 
end 
