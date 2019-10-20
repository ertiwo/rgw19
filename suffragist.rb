
require 'sinatra'

Choices = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'CUR' => 'Curry',
  'NOO' => 'Noodles',
}

get '/' do
  erb :index
end


post '/cast' do
  @vote  = params['vote']
  current_votes = Results[@vote]
  puts current_votes
  Results[@vote] = current_votes + 1
  puts Results  
  File.write("results.yaml", Results.to_yaml)
  erb :cast
end


require 'yaml'
Results = YAML.load(File.read("results.yaml"))


get '/results' do
  erb :results
end
