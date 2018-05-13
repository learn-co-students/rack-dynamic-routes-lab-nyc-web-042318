class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      the_item = req.path.split("/items/").last

      if item = @@items.find do |thing|
          thing.name == the_item
        end
        resp.write item.price
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

#
# class Application
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path.match("/items/")
#       the_item = req.path.split("/items/").last
#
#       item = @@items.find do |thing|
#         thing.name == the_item
#       end
#       resp.write item.price
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end
#
#     resp.finish
#   end
#
# end
