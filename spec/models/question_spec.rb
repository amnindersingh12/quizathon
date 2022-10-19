require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "Associations" do
    it "belongs_to quiz" do
      relation = described_class.reflect_on_association(:quiz)
      expect(relation.macro).to eq :belongs_to
    end

    it 'has_many choices' do
     relation = described_class.reflect_on_association(:choices)
      expect(relation.macro).to eq :has_many
    end

     it 'has_one answer' do
     relation = described_class.reflect_on_association(:answer)
      expect(relation.macro).to eq :has_one
    end
  end

  describe "Validates" do

context "with valid text" do
      it { expect(build(:question)).to be_valid }
end
context "with invalid text" do
      it { expect(build(:question,text: nil)).to be_valid }
end
  end
end
