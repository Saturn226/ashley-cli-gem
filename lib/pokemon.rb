#This is going to be a class to create pokemon objects

class Pokemon
  attr_accessor :pokedex_number, :name
  @@all = []

  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.scrape_pokemon
    # Get all the pokemon data
    data = self.scrape_data
    # [
    #   {
    #     :name => "Balbusar",
    #     :pokedex_number => 82
    #   },
    #   {
    #     :name => "Balbusar",
    #     :pokedex_number => 82
    #   },      
    # ]
    # # 
    
    data.each do |pokemon|
      p = Pokemon.new(pokemon[:name])
      p.pokedex_number = pokemon[:pokedex_number]
    end
  end

  def self.scrape_data
    # ["Bilbolast", "Electricat", "waterwooze"]
    @doc = Nokogiri::HTML(open("http://pokemondb.net/pokedex/national"))

    # get all the info cards
    pokemon_cards = @doc.search("span.infocard-tall")

    pokemon_cards.collect do |card|
      {
        :name => card.search(".ent-name").text,
        :pokedex_number =>  card.search("small:first").text.gsub(/#/,"").to_i
      }
    end
  end

  def self.all
    @@all
  end
end

