FactoryBot.define do
  factory :question do
      association :quiz, factory: :quiz

    quiz_id {2}
    text {"hey, who's there?"}
    points {12}
    position {3}
  end
end
