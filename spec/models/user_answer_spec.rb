require 'rails_helper'

RSpec.describe UserAnswer, type: :model do
  describe 'Assosiations' do
    it 'belongs_to user_quiz_session' do
      relation = described_class.reflect_on_association(:user_quiz_session)
      expect(relation.macro).to eq :belongs_to
    end
     it 'belongs_to question' do
      relation = described_class.reflect_on_association(:question)
      expect(relation.macro).to eq :belongs_to
    end
     it 'belongs_to choice' do
      relation = described_class.reflect_on_association(:choice)
      expect(relation.macro).to eq :belongs_to

    end
  end

end
