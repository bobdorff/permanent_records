module RecordsHelper

  def generate_wrapper
    wrapper = Discogs::Wrapper.new("Search OAuth", user_token: ENV['DISCOGS_TOKEN'])
    wrapper
  end

  def query_creator(params)
    if !params[:artist_name].empty? && !params[:album_title].empty?
      query = "#{params[:artist_name]} - #{params[:album_title]}"
    elsif !params[:artist_name].empty? && params[:album_title].empty?
      query = params[:artist_name].to_s
    else
      query = params[:album_title].to_s  
    end
    query
  end

  def record_in_database?
    Record.find_by(catno: record_params[:catno])
  end

  def create_record
    @record = Record.new(record_params)
    @record.save
  end
end


