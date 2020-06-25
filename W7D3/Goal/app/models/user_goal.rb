class UserGoal < ApplicationRecord
    validates :body, presence:true
    #validates :complete, inclusion: {in: [true, false], message: "Please, select one!"}
    belongs_to :user
end
