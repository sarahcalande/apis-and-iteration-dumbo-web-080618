require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  #make the web request

  films_array = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)


  response_hash["results"].each do |results_hash|
    results_hash["name"]

    if character == results_hash["name"].downcase
      films_array = results_hash["films"]
    end

  end

  films_array
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end


def print_movies(films_array)
  if films_array.length > 0
    for i in 0..films_array.length-1 do
      response_string = RestClient.get(films_array[i])
      response_hash = JSON.parse(response_string)
      puts "#{i+1}. #{response_hash["title"]}"
    end
  else
    puts "The person you input is not a character in the Starwars movie Universe"
  end

  # some iteration magic and puts out the movies in a nice list
end


def show_character_movies(character)

  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end



## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
