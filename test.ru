require 'httparty'

class HelloWorld
  def call(env)
    body = HTTParty.post('https://api.workshare.net/compare-service/api/Compare') 

   [200, { 'Content-Type' => 'text/plain', 'Content-Length' => body.length.to_s }, [body]]
  end
end

run HelloWorld.new
