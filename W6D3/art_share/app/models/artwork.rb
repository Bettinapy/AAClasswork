class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title}
    validates :title, :image_url, presence: true
    
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare  

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
    
    has_many :comments,
        dependent: :destroy,
        foreign_key: :artwork_id,
        class_name: :Comment

    has_many :likes,
        :as => :likeable
    
    has_many :likers,
        through: :likes,
        source: :user

end 