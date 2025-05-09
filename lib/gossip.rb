
#require 'pry'
require 'csv'

class Gossip

    attr_reader :author, :content, :date_last_update

    def initialize(author, content)
        @content = content
        @author = author
    end

    def save
        file = File.path("./db/gossip.csv")
        CSV.open(file,"a") do |csv|
            if File.zero?(file)
                csv << ["author","content"]
            end
            csv << [self.author.to_s, self.content.to_s]
        end
        puts ">>>>> Enregistrement SUCCES <<<<<".colorize(:green)
    end

    def self.all
        all_gossips = []
        CSV.foreach("./db/gossip.csv", headers: true) do |csv|
            all_gossips << csv.to_h
        end
        return all_gossips
    end

    def self.delete(author)
        new_csv_file = CSV.read("./db/gossip.csv", headers: true).delete_if { |csv| csv["author"] == author}
        CSV.open("./db/gossip.csv", "w", write_headers: true, headers: new_csv_file.headers) do |csv|
            new_csv_file.each do |line|
                csv << line
            end
        end
        puts "Suppression SUCCES !! - Auteurs : #{author} -".colorize(:green)
    end

end

# binding.pry