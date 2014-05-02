require 'populator'
require 'faker'

FactoryGirl.define do
  sequence(:firstName) { |n| "FirstName#{n}" }
  sequence(:lastName) { |n| "LastName#{n}" }
  factory :customer do
    firstName 
    lastName 
  end

  factory :charge do
    created Time.now
    paid  [true, false].sample
    amount 10
    currency 'eur'
    refunded [true, false].sample
  end
end
