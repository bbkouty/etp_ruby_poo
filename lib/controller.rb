# controller.rb
require_relative 'view'
require_relative 'gossip'

class Controller

    def initialize 
        @view = View.new
    end

    def create_gossip
        params =@view.create_gossip
        gossip = Gossip.new(params["author"],params["content"])
        gossip.save
    end

    def index_gossips
        gossips = Gossip.all
        @view.index_gossips(gossips)
    end

    def delete_gossip(author)
     Gossip.delete(author)
    end

end