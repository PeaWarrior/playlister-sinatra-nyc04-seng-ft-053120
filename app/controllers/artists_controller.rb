class ArtistsController < ApplicationController
    get '/artists' do
        erb :"artists/index"
    end

    get '/artists/:slug' do
        @artist = Artist.find_by(params[:slug])
        erb :"artists/:slug"
    end
end
