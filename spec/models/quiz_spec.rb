require 'rails_helper'

RSpec.describe Quiz, type: :model do
   describe "Associations" do
    it 'has_many questions' do
     relation = described_class.reflect_on_association(:questions)
      expect(relation.macro).to eq :has_many
    end
    it 'has_many user_quiz_sessions' do
     relation = described_class.reflect_on_association(:user_quiz_sessions)
      expect(relation.macro).to eq :has_many
    end
    it 'has_many users through user_quiz_sessions' do
     relation = described_class.reflect_on_association(:users)
      expect(relation.options.first).to eq %i[through user_quiz_sessions]
    end
  end

  describe 'Callbacks' do
    it 'has a permlink' do
      quiz =Quiz.create
      expect(quiz.permalink).to_not be_nil
    end
  end
end
