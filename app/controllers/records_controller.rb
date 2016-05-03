class RecordsController < ApplicationController
  def new
    # if params[:artist_name].empty? && params[:album_title].empty?
    #   @results = {"Please enter the name of a band, the title of a record, or both."}
    #   render layout: false
    # else
      wrapper = generate_wrapper 
      query = query_creator(params)
      request_type = 
      @results = wrapper.search( query, :format => :vinyl).results
      render layout: false      
    # end
  end



end
