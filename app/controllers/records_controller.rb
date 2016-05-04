class RecordsController < ApplicationController
  def index 
    wrapper = generate_wrapper 
    query = query_creator(params)
    @results = wrapper.search( query, :format => :vinyl ).results
    render layout: false      
  end

  def new
    @record = params
    render layout: false
  end

  def create
  end

end
