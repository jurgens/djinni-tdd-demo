class DevelopersController < ApplicationController

  before_action :find_keyword

  def show
    @developers = DeveloperQuery.call search_params
  end

  private

  def find_keyword
    @keyword = params[:keyword]
  end

  def search_params
    params.permit :keyword
  end
end
