# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Like.destroy_all
Comment.destroy_all

viewer1 = User.create!(user_name: 'Chris')
viewer2 = User.create!(user_name: 'Yuan')
viewer3 = User.create!(user_name: 'Alvin')
artist1 = User.create!(user_name: 'Rosemary')
artist2 = User.create!(user_name: 'Andy')

artwork1 = Artwork.create!(title:"Rose painting", image_url:"rose_paint.com", artist_id: artist1.id)
artwork2 = Artwork.create!(title:"Andy photograph", image_url:"andy_photo.com", artist_id: artist2.id)
artwork3 = Artwork.create!(title:"Andy painting", image_url:"andy_paint.com", artist_id: artist2.id)

artwork_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: viewer1.id)
artwork_share2 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: viewer2.id)
artwork_share3 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: viewer3.id)
artwork_share4 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: viewer1.id)
artwork_share5 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: viewer2.id)

comment1 = Comment.create!(user_id: viewer1.id, artwork_id: artwork1.id, body: "Chris likes Rosemary's painting")
comment2 = Comment.create!(user_id: viewer1.id, artwork_id: artwork2.id, body: "Chris likes Andy's photo")
comment3 = Comment.create!(user_id: viewer2.id, artwork_id: artwork1.id, body: "Yuan likes Rosemary's painting")

like1 = Like.create!(:likeable => comment1, user_id: viewer1.id)
like2 = Like.create!(:likeable => comment1, user_id: viewer2.id)
like3 = Like.create!(:likeable => artwork1, user_id: viewer1.id)
like4 = Like.create!(:likeable => artwork1, user_id: viewer3.id)
