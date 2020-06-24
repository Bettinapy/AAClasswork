class Album < ApplicationRecord
    ALBUM_MUSIC_TYPE = %w(live studio).freeze
    validates :title, :year, presence: true
    validates :music_type, inclusion: { in: ["live","studio"], message: "%{value} is not a valid type!"}
    belongs_to :band, 
        foreign_key: :band_id,
        class_name: :Band
end
