class RecordsController < ApplicationController
  def index 
    @record = Record.new
    wrapper = generate_wrapper 
    query = query_creator(params)
    @results = wrapper.search( query, :format => :vinyl ).results
    render layout: false      
  end

  def new
    @post = Record.new
    @record = Record.new
    if !record_in_database?
      create_record
    end
      @result = params
      render layout: false
  end

  def create
    if record_in_database?
      #create listening session
    else
      create_record
    end
  end

  private

  def record_params
    params.require(:record).permit(:thumb, :title, :label, :catno, :year, :release, :artist)
  end
end
