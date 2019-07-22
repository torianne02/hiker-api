class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default 
  end 

  # check if version is specified or is default
  def matches?(request)
    check_headers(request.headers) || default
  end 

  private 

  # check v from Accept headers; expect custom media type 'users'
  def check_headers(headers)
    accept = headers[:accept]
    accept && accept.include?("application/vnd.users.#{version}+json")
  end 
end 