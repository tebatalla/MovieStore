# == Schema Information
#
# Table name: purchase_options
#
#  id         :integer          not null, primary key
#  price      :decimal(, )      not null
#  quality    :string
#  movie_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PurchaseOption < ActiveRecord::Base
  validates :price, :movie_id, presence: true
  belongs_to :movie
end
