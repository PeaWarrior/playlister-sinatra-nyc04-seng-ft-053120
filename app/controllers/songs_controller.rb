class SongsController < ApplicationController
    get '/songs' do
        erb :"songs/index"
    end

    get '/songs/new' do
        erb :"songs/new"
    end

    post '/songs' do
        new_song = Song.create(params[:song]) 
       
        params[:genre].each do |genre_hash|
            if Genre.where(genre_hash)
                new_song.genres << Genre.where(genre_hash).first
            else 
                new_song.genres << Genre.create(genre_hash)
            end
        end

        if Artist.where(params[:artist]) != []
            Artist.where(params[:artist]).first.songs << new_song
        else 
            Artist.create(params[:artist]).songs << new_song
        end

        redirect to "/songs/#{new_song.slug}"
    end
    
    get '/songs/:slug' do
        @song = Song.find_by(params[:slug])
        
        erb :"songs/:slug"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by(params[:slug])
        
        erb :"songs/edit"
    end

    patch '/songs/:slug' do
        @song = Song.find_by(params[:slug])
        @artist = Artist.where(params[:artist]).first
        @song.update(artist: @artist, name: params[:song][:name])
        
        redirect to "songs/#{@song.slug}"
    end

end