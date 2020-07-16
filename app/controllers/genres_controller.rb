class GenresController < ApplicationController
    get '/genres' do
        erb :"genres/index"
    end

    get '/genres/:slug' do
        # get the users input by accessing params and make it accessible throughout the method
        @genre = Genre.find_by(params[:slug])
        erb :"genres/:slug"
    end
end