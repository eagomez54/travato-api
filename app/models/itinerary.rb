# == Schema Information
#
# Table name: itineraries
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  city           :string
#  name           :string
#  price          :decimal(10, 2)
#  description    :text
#  total_capacity :integer
#  spots_sold     :integer
#  start_time     :datetime
#  end_time       :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pic_url        :string
#  date           :date
#

class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :itinerary_users
  has_many :itinerary_users, inverse_of: :itinerary, dependent: :destroy
  validate :has_space_for_guest?

  def host
    user
  end

  def guests
    users
  end

  def has_space_for_guest?
  	errors.add(:is_full, "This itinerary has no more space.") if spots_sold > total_capacity
  end
end
