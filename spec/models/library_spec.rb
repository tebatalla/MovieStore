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

require 'rails_helper'

RSpec.describe Library, type: :model do
  describe "purchase movie" do
    before(:all) do
      User.delete_all
      Movie.delete_all
      PurchaseOption.delete_all
      Library.delete_all
    end
    let(:jack) { User.create!(nickname: "jack",
                          email:'jack@jack.com',
                          password: "abcdef",
                          password_confirmation: 'abcdef') }
    let(:movie) { Movie.create!(title: 'Terminator', plot: 'Machine sent back in time to kill.') }
    let(:option) { PurchaseOption.create!(movie_id: movie.id, price: 3.99, quality: 'HD') }
    it "user cannot purchase two of the same movies" do
      order = Library.create!(user_id: jack.id, purchase_option_id: option.id)
      expect(Library.first).to eq(order)
      same_order = Library.create(user_id: jack.id, purchase_option_id: option.id)
      expect(Library.count).to eq(1)
    end
  end
end
