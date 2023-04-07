class Project < ApplicationRecord
  belongs_to :user
  paginates_per(5)
  def self.ransackable_attributes(auth_object = nil)
    [ "price", "name" ,"description"]
  end
  def self.ransackable_associations(auth_object = nil)
    [ "name", "price","description" ]
  end

end
