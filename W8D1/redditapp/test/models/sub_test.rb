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
require 'test_helper'

class SubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end