FactoryBot.define do
  factory :question do
    quiz
    text {"hey, who's there?"}
    points {12}
    position {3}
  end
end
