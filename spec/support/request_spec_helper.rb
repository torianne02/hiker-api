module RequestSpecHelper
  # parse JSON 
  def json 
    JSON.parse(response.body)
  end
end