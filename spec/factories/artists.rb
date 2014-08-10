# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :artist do
    nickname "MyString"
    sex 1
    mobile "MyString"
    email "MyString"
    birthday "2014-08-07"
  end
end
