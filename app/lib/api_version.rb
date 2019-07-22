class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default 
  end 
end 