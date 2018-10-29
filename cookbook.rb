require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_path_file)
    @csv_path_file = csv_path_file
    @cookbook = []
    loadcsv
  end

  def loadcsv
    CSV.foreach(@csv_path_file) do |row|
      recipe = Recipe.new(row[0], row[1], row[2], row[3], row[4])
      @cookbook << recipe
    end
  end

  def savecsv
    CSV.open(@csv_path_file, 'wb') do |csv|
      @cookbook.each { |recipe| csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done, recipe.difficulty] }
    end
  end

  def all
    @cookbook
  end

  def add_recipe(recipe)
    @cookbook << recipe
    savecsv
  end

  def remove_recipe(recipe_index)
    @cookbook.delete_at(recipe_index)
    savecsv
  end
end
