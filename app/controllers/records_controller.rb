class RecordsController < ApplicationController
  def new
    if params[:artist_name].empty? && params[:album_title].empty?
      flash.now[:danger] = "Please submit an album title, artist name or both."
      @results = ["Nothing matched your search."]
      render layout: false
    else
      wrapper = generate_wrapper 
      query = search_formatter(params)
      "*************"
      p query
      @results = wrapper.search(query)
      render layout: false      
    end
  end



end
