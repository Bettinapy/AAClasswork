class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title}, presence: true
    validates :title, presence: true
    
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    
end 