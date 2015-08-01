module RecipesHelper

  def cookbook_summon
    your_cookbooks = []
    @cookbooks.each { |cookbook| @your_cookbooks << [cookbook.name, cookbook.id] }
    return your_cookbooks
  end
end
