
class CLI

  def initialize
    puts "Welcome to our pokedex"
    puts "What would you like to do?"
  end

  def call
    Pokemon.scrape_pokemon
    display_menu
  end


  def list_pokemon
    # Get a list of all pokemon
    Pokemon.all.each do |pokemon|
      display_name_number(pokemon)
    end
  end

  def search_by_number
    puts "What is the number you are searching for?"
    number = gets.chomp().to_i
    #displays pokemon by pokedex number
    if number.between?(1,Pokemon.all.length)
      puts "---------------"
      Pokemon.all.detect {|pokemon| display_name_number(pokemon) if pokemon.pokedex_number == number}
      puts "---------------"
    else
      puts "No such pokemon"
    end

  end

  def sort_by_name
    sorted_array = Pokemon.all.sort_by{|pokemon| pokemon.name}
    sorted_array.each do |pokemon|
        display_name_number(pokemon)
      end
  end

  def sort_by_number
    list_pokemon
  end

  def display_name_number(pokemon)
    puts "#{pokemon.pokedex_number}. #{pokemon.name}"
  end

  def display_menu
    puts "1)List Pokemon 2)Search by number 3)Sort by Name 4)Sort By number 5)Exit"
    input = gets.chomp()
    if input != '5'
      case input
      when '1'
        list_pokemon
      when '2'
        search_by_number
      when '3'
        sort_by_name
      when '4'
        sort_by_number
      else
        puts "Not an option"
      end
      display_menu
    else
      puts "Thanks for using my pokedex. Goodbye!"
    end
  end
end