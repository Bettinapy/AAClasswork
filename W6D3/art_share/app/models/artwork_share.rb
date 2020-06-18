class ArtworkShare < ApplicationRecord
    validates :artwork_id, uniqueness: {scope: :viewer_id}, presence: true
    validates :viewer_id, presence: true
    
    belongs_to :viewer,
        class_name: :User,
        foreign_key: :viewer_id
    
    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork   
    
    
end