require 'pry'

class Application
  
  @@items = Item.all
  
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
  
    if req.path.match(/item/)
      item_name = req.path.split("\/").last
      item = @@items.find {|i| i.name == item_name}
      if item.nil?
        resp.write "Not found"
        resp.status = 404
      else
        resp.write "#{item.price}\n"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
  resp.finish
  end
end