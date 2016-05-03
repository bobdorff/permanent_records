module RecordsHelper

  def generate_wrapper
    wrapper = Discogs::Wrapper.new("Search OAuth", user_token: 'QDUeFOZNwIwOePlxpVziEHzamhbIHUdfENAJTnLR')
    p ")))))))))))))))))))))))))"
    p wrapper
    wrapper
  end

  def query_creator(params)
    if !params[:artist_name].empty? && !params[:album_title].empty?
      query = "#{params[:artist_name]} - #{params[:album_title]}"
    elsif !params[:artist_name].empty? && params[:album_title].empty?
      query = params[:artist_name].to_s
    else
      query = params[:album_name].to_s  
    end
    query
  end


end


