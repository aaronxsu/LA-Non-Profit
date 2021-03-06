# == Schema Information
#
# Table name: organizations
#
#  id            :integer          not null, primary key
#  name          :string
#  size          :string
#  org_type      :string
#  address       :string
#  city          :string
#  zip           :integer
#  county        :string
#  state         :string
#  latitude      :float
#  longitude     :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ratings_count :integer
#

class Organization < ActiveRecord::Base
  has_many :ratings, inverse_of: :organization, dependent: :delete_all
  # validates_associated :ratings
end
