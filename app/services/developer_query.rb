class DeveloperQuery
  attr_accessor :params

  def self.call(params)
    self.new(params).query
  end

  def initialize(params)
    @params = params
  end

  def query
    Developer.where("title LIKE ?", "%#{keyword}%")
  end

  def keyword
    params[:keyword]
  end
end
