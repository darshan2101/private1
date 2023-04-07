FactoryBot.define do
  factory :users do
    fName { Faker::Name.first_name } 
    lName { Faker::Name.last_name  }
    email { Faker::Internet.email  }
    
  end
end
