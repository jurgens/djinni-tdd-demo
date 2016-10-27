class DevelopersController < ApplicationController

  before_action :find_keyword
  before_action :find_city

  def show
    @cities = City.all

    @developers = DeveloperQuery.call search_params
  end

  private

  def find_keyword
    @keyword = params[:keyword]
  end

  def find_city
    @selected_city = City.find_by id: params[:city]
  end

  def search_params
    params.permit :keyword, :city
  end
end
