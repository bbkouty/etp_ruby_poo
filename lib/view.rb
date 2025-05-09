# view.rb
require 'colorize'

class View

    def initialize 
    end

    def create_gossip
        puts "Veillez saisir les informations de l'auteur".colorize(:blue)
        author = gets.chomp.to_s
        puts "Veillez à saisir le contenue de votre gossip".colorize(:blue)
        content = gets.chomp.to_s
        
        return params = {
            "content" => content,
            "author" => author
        }
    end

    def index_gossips (gossips)
        gossips.each do |gossip|
            puts " Posté par : #{gossip["author"]}"
            puts " content : " + gossip["content"] 
            puts "-".colorize(:red) * 40
        end
    end

end