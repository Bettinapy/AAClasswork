# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  description :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Sub < ApplicationRecord
    validates :title, :description, presence: true
    belongs_to :moderator,
        foreign_key: :user_id,
        class_name: :User
    
    has_many :post_subs,
        foreign_key: :sub_id,
        class_name: :PostSub

    has_many :posts,
        through: :post_subs,
        source: :post
end
