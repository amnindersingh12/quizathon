require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validate associations' do
    it 'with user_quiz_sessions' do
      relation = described_class.reflect_on_association(:user_quiz_sessions)
      expect(relation.macro).to eq :has_many
    end

    it 'with quizzes through user_quiz_sessions' do
      relation = described_class.reflect_on_association(:quizzes)
      expect(relation.options.first).to eq %i[through user_quiz_sessions]
    end
  end

  describe 'validate' do
    context 'with valid first_name, last_name, email' do
      specify { expect(user).to be_valid }
    end
    context 'with invalid first_name, last_name, email' do
      it { expect(build(:user, first_name: nil, last_name: nil, email: nil)).not_to(be_valid) }
    end

    context 'with uniqueness in email' do
      User.create!(email: 'a@a.com', password: 'password', first_name: 'asdf', last_name: 'asdfa')

      new_user = User.new(email: 'a@a.com', password: 'password', first_name: 'asdf', last_name: 'asdfa')
      new_user.valid?
      specify { expect(new_user.errors[:email]).to include('has already been taken') }
    end
  end
end
