class DeveloperQuery
  attr_accessor :params

  def self.call(params)
    self.new(params).query
  end

  def initialize(params)
    @params = params
  end

  def query
    Developer.by_keyword(keyword).by_city(city)
  end

  def keyword
    params[:keyword]
  end

  def city
    params[:city]
  end
end
