# == Schema Information
#
# Table name: ratings
#
#  id              :integer          not null, primary key
#  user_name       :string
#  score           :decimal(3, 1)
#  comment         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer
#

class Rating < ActiveRecord::Base
  belongs_to :organization, -> { readonly },
                            inverse_of: :ratings,
                            foreign_key: 'organization_id'

  validates :user_name, presence: { message: 'Your preferred name to display must be given' },
                        length: { maximum: 12,
                                  message: 'Your user name should be shorter than 12 letters' }

  validates :score, presence: { message: 'You must specify a score on this organization' },
                     numericality: { greater_than_or_equal_to:0,
                                     less_than_or_equal_to:10,
                                     message: 'The score should range 0 - 10' }

  validates :comment, length: { maximum: 300,
                                message: 'Please comment within 300 words' }
end
