# view.rb
require 'colorize'

class View

    def create_gossip
        puts "Veuillez saisir les informations de l'auteur:".colorize(:blue)
        print "> "
        author = gets.chomp.to_s
        puts "Veuillez saisir le contenue de votre gossip:".colorize(:blue)
        print "> "
        content = gets.chomp.to_s
        
        return params = {
            "content" => content,
            "author" => author
        }
    end

    def index_gossips (gossips)
        gossips.each do |gossip|
            puts " Posté par : #{gossip["author"]}"
            puts " contenu : " + gossip["content"] 
            puts "-".colorize(:red) * 40
        end
    end

end