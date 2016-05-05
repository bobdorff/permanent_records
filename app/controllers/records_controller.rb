class RecordsController < ApplicationController
  def index 
    @record = Record.new
    wrapper = generate_wrapper 
    query = query_creator(params)
    @results = wrapper.search( query, :format => :vinyl ).results
    render layout: false      
  end

  def new
    @post = Post.new
    @record = Record.new
    if !record_in_database?
      create_record
    end
      @result = params["record"]
      render layout: false
  end

  private

  def record_params
    params.require(:record).permit(:thumb, :title, :label, :catno, :year, :release, :artist)
  end
end
