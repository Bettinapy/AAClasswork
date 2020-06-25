FactoryBot.define do
  factory :user_goal do
    body { "MyString" }
    user_id { 1 }
    complete? { false }
    private? { false }
  end
end
