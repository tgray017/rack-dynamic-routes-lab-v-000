require 'pry'

class Application
  
  @@items = Item.all
  
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
  
    if req.path.match(/item/)
      binding.pry
      @@items.each do |item|
        resp.write "#{item.price}\n"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    
  resp.finish
  end
  
end