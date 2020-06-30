# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :string
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  sub_id     :integer
#
class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User
    has_many :post_subs,
        foreign_key: :post_id,
        class_name: :PostSub
    has_many :subs,
        through: :post_subs,
        source: :sub
end
