class StaticPagesController < ApplicationController
  def index
    @categories = Category.select{|category| category.questions.size >= 5}
  end
end
