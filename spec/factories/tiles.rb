# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tile do
    word "Boston"
    timestamp "#{Time.now}"
  end
end
