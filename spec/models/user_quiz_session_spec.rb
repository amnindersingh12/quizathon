require 'rails_helper'

RSpec.describe UserQuizSession, type: :model do
  describe "Associations" do
    it 'belongs_to user' do
    relation = described_class.reflect_on_association(:user)
      expect(relation.macro).to eq :belongs_to
    end
    it 'has_many quiz' do
      relation = described_class.reflect_on_association(:quiz)
      expect(relation.macro).to eq :belongs_to
    end
  end
end


