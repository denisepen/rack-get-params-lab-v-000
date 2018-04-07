class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    
    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      @@cart.each do |c|
        resp.write "#{c}\n"
      end
    elsif req.path.match(/add/)
      potential_item = req.params["item"]

      if exists?
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def exists?(item)
    if @@items.include?(item)
      true
    else
      false
    end
  end
  
  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
