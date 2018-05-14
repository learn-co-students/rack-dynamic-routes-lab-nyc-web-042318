class Application



  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last
      if my_item = @@items.find do |item|item.name == (item_name)
        end
        resp.write my_item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
     resp.write "Route not found"
     resp.status = 404
   end


    resp.finish
  end
end
