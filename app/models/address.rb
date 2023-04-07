class Address < ApplicationRecord
  belongs_to :user,  inverse_of: :addresses
  validates :local ,presence: :true
  validates :city ,presence: :true
  validates :state ,presence: :true
  validates :country ,presence: :true
  validates :pincode ,presence: :true
end
