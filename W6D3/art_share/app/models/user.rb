class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true

    has_many :artworks, 
        dependent: :destroy,
        foreign_key: :artist_id,
        class_name: :Artwork
    
    has_many :artwork_shares,  
        dependent: :destroy,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :artwork_shares, 
        source: :artwork
    
    has_many :comments,
        dependent: :destroy,
        foreign_key: :user_id,
        class_name: :Comment

    has_many :likes,
        foreign_key: :user_id,
        class_name: :Like
        
    has_many :liked_comments,
        through: :likes,
        source: :likeable,
        source_type: "Comment"

    has_many :liked_artworks,
        through: :likes,
        source: :likeable,
        source_type: "Artwork"

end