class RecordsController < ApplicationController
  def index 
    wrapper = generate_wrapper 
    query = query_creator(params)
    @results = wrapper.search( query, :format => :vinyl).results
    render layout: false      
  end

  def new
  end

end
