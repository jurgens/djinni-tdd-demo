class DevelopersController < ApplicationController
  def show
    @developers = Developer.all
  end
end
