require "flickr"

class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    url = "https://live.staticflickr.com/"
    begin
      current_data = flickr.people.getPublicPhotos(user_id: params[:user_id])
      @photos = current_data.map { |hashed| [ hashed.title, "#{url}#{hashed.server}/#{hashed.id}_#{hashed.secret}_c.jpg" ] }
    rescue
      puts "There was an error"
    end
  end
end
