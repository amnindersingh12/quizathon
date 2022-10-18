FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { 'abc@a.com' }
    password { 'password' }
  end
end
