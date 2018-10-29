require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require "pry-byebug"
require_relative 'cookbook'
require_relative 'recipe'
set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end
csv_file = File.join(__dir__, 'recipe.csv')
cookbook = Cookbook.new(csv_file)

get '/' do
  @recipies = cookbook.all
  erb :index
end

get '/about' do
  erb :about
end

get '/new' do
  erb :new
end

post '/new' do
  new_recipe = Recipe.new(params["recipe_name"], params["description"])
  cookbook.add_recipe(new_recipe)
  redirect "/"
end

get '/destroy' do
  @recipies = cookbook.all
  erb :destroy
end

post '/destroy' do
  recipe_index = params["index"].to_i
  cookbook.remove_recipe(recipe_index - 1)
  redirect "/"
end
