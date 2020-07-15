class Song < ActiveRecord::Base
    has_many :song_genres
    belongs_to :artist

end