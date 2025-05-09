# router.rb
require 'colorize'
require_relative 'controller'

class Router

    def initialize()
        @controller = Controller.new
    end

    def perform 
        
        puts "BIENVENUE DANS THE GOSSIP PROJECT !!"

        while true
            # the menu of the app
            puts"=".colorize(:gray) * 18 + "MENU" + "=".colorize(:gray) * 18
            puts "Tu veux faire quoi jeune Gossipeur".colorize(:blue)
            puts "Tape \'1\' si tu veux créer un gossip ".colorize(:blue)
            puts "Tape \'2\' pour avoir la liste des gossips ".colorize(:blue)
            puts "Tape \'3\' pour supprimer les gossips d'un auteur".colorize(:blue)
            puts "Tape \'4\' si tu veux quitter l'app".colorize(:blue)
            puts"=".colorize(:gray) * 40
            params = gets.chomp.to_i 

            case params
                when 1
                    puts "Tu as choisi de créer un gossip".colorize(:blue)
                    @controller.create_gossip
                when 2
                    puts "Voici la liste des gossips"
                    puts "=" * 40
                    @controller.index_gossips
                when 3
                    puts "Vous allez supprimer par auteur! "
                    puts "Saisi le nom d'un auteur : "
                    author = gets.chomp.to_s
                    @controller.delete_gossip(author)
                when 4 
                    puts "MERCI et à Bientôt !".colorize(:blue)
                break
            else
                puts "Ce choix n'est pas autorisé, Recommencer".colorize(:red)
            end
        end
    end

end