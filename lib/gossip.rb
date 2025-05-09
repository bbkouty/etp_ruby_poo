require 'csv'

class Gossip
  attr_reader :author, :content, :date_last_update
  
  def initialize(author, content)
    @content = content
    @author = author
    @date_last_update = Time.now.to_s
  end
  
  def save
    file_path = "./db/gossip.csv"
    headers = ["author", "content", "date_last_update"]
    
    # Vérifie si le fichier existe et si les en-têtes sont absents ou incorrects
    file_exists = File.exist?(file_path)
    headers_missing = false
    if file_exists
      begin
        headers_missing = CSV.open(file_path, &:readline) != headers
      rescue CSV::MalformedCSVError
        headers_missing = true
      end
    end
    
    # Réécrit le fichier avec les en-têtes si nécessaire
    if !file_exists || headers_missing
      CSV.open(file_path, "w") do |csv|
        csv << headers
      end
    end
    
    # Ajoute les données
    CSV.open(file_path, "a") do |csv|
      csv << [self.author.to_s, self.content.to_s, @date_last_update]
    end
    puts ">>>>> Enregistrement AVEC SUCCES <<<<<".colorize(:green)
  end
  
  def self.all
    all_gossips = []
    begin
      CSV.foreach("./db/gossip.csv", headers: true) do |csv|
        all_gossips << csv.to_h
      end
    rescue Errno::ENOENT
      # Le fichier n'existe pas encore
      puts "Aucun gossip trouvé".colorize(:yellow)
    end
    return all_gossips
  end
  
  def self.delete_gossips_by_author(author)
    file_path = "./db/gossip.csv"
    deleted_count = 0
    
    begin
      rows = CSV.read(file_path, headers: true)
      original_count = rows.count
      
      # Filtrer les lignes qui ne correspondent pas à l'auteur spécifié
      rows.delete_if do |row| 
        if row["author"] == author
          deleted_count += 1
          true
        else
          false
        end
      end
      
      # Réécrire le fichier CSV sans les lignes supprimées
      CSV.open(file_path, "w", write_headers: true, headers: rows.headers) do |csv|
        rows.each do |line|
          csv << line
        end
      end
      
      if deleted_count > 0
        puts "Suppression avec SUCCES !! - #{deleted_count} gossip(s) de l'auteur '#{author}' supprimé(s).".colorize(:green)
      else
        puts "Aucun gossip trouvé pour l'auteur '#{author}'.".colorize(:yellow)
      end
    rescue Errno::ENOENT
      puts "Fichier de gossips introuvable.".colorize(:red)
    end
  end
  
  def self.delete_gossips_by_index(index)
    file_path = "./db/gossip.csv"
    
    begin
            
      # Lire le fichier CSV
      rows = CSV.read(file_path, headers: true)
      
      # Les index dans Ruby commencent à 0
      if index >= 0 && index < rows.size
        # Mémoriser l'auteur pour le message de confirmation
        author = rows[index]["author"]
        
        # Supprimer la ligne à l'index spécifié
        rows.delete(index)
        
        # Réécrire le fichier CSV sans la ligne supprimée
        CSV.open(file_path, "w", write_headers: true, headers: rows.headers) do |csv|
          rows.each do |line|
            csv << line
          end
        end
        
        puts "Suppression avec SUCCES !! - Gossip ##{index} de '#{author}' supprimé.".colorize(:green)
      else
        puts "Index invalide. Aucune suppression effectuée.".colorize(:red)
      end
    rescue Errno::ENOENT
      puts "Fichier de gossips introuvable.".colorize(:red)
    rescue => e
      puts "Erreur lors de la suppression: #{e.message}".colorize(:red)
    end
  end
end