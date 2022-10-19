require 'rails_helper'

RSpec.describe Choice, type: :model do
  describe "Associations" do
    it "belongs_to question" do
      relation = described_class.reflect_on_association(:question)
      expect(relation.macro).to eq :belongs_to
    end
  end
end
