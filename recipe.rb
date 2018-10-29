class Recipe
  attr_reader :description, :name, :prep_time, :difficulty
  attr_accessor :done
  def initialize(name, description, prep_time = "", done = "false", difficulty = "")
    @name = name
    @description = description
    @prep_time = prep_time
    @done = done
    @difficulty = difficulty
  end

  def done?
    true if @done == "true"
  end

  def mark_as_done
    @done = "true"
  end
end
