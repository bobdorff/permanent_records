module RecordsHelper

  def generate_wrapper
    wrapper = Discogs::Wrapper.new("Search OAuth", user_token: 'QDUeFOZNwIwOePlxpVziEHzamhbIHUdfENAJTnLR')
    p ")))))))))))))))))))))))))"
    p wrapper
    wrapper
  end

  def search_formatter(params)
    query = {}
    if !params[:artist_name].empty? && !params[:album_title].empty?
      query[:title] = "#{params[:artist_name]} - #{params[:album_title]}"
      query[:format] = "vinyl"
    elsif !params[:artist_name].empty? && params[:album_title].empty?
      query[:format] = "vinyl"
      query[:artist] = "#{params[:artist_name]}"
    elsif params[:artist_name].empty? && params[:album_title].empty?
      query[:format] = "vinyl"
      query[:artist] = "#{params[:artist_name]}"
    end
    query.each 

  end
end


