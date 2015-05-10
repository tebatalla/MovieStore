# == Schema Information
#
# Table name: libraries
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  purchase_option_id :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Library < ActiveRecord::Base
  validates :user_id, :purchase_option_id, presence: true
  belongs_to :purchase_option
  belongs_to :user
  has_one :movie, through: :purchase_option, source: :movie
end
