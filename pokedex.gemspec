Gem::Specification.new do |s|
  s.name        = 'pokedex'
  s.version     = '0.0.1'
  s.summary     = "My CLI project"
  s.description = "Scrapes a pokedex and allows you to search and sor"
  s.authors     = ["Ashley Muller"]
  s.email       = 'serenehopes@gmail.com'
  s.files       = ["lib/cli.rb", "lib/pokemon.rb","bin/pokedex"]
  s.executables << 'pokedex'
end