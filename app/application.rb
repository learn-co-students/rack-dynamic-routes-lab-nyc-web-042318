class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
    the_item = req.path.split("/items/").last
      if new_item = @@items.find do |item|
        item.name == the_item
        end
        resp.write new_item.price
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
