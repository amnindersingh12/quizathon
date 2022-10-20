require 'rails_helper'

RSpec.describe "Quizzes", type: :request do
  include_context :log_in_user
  let(:invalid_attributes) do
    {
    id: nil,
    title: nil,
    permalink: nil,
    start: nil,
    end: nil
    }
  end

  describe "GET /quizzes" do
    it "renders the index page" do
      get quizzes_path
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /show' do
    it 'renders the show page' do
      quiz = Quiz.create
      get quizzes_path(quiz.permalink)
      expect(response).to(be_successful)
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          title: 'New_Language',
          permalink: "6450332d-78c4-4a83-8644-b0cea9dc6852",
          start: 1,
          end: 10
        }
      end

      it 'updates the requested quiz' do
        quiz = Quiz.create!(permalink: "6450332d-78c4-4a83-8644-b0cea9dc6852")
        patch quiz_path(quiz, params: { quiz: new_attributes })
        quiz.reload
        expect(quiz.updated_at.to_s).to(eq(Time.now.utc.to_s))
      end

    end
    context 'with invalid parameters' do
      it "renders the 'edit' page again)" do
        quiz = Quiz.create!(permalink: "6450332d-78c4-4a83-8644-b0cea9dc6852")
        patch quiz_path(quiz, params: { quiz: invalid_attributes })
        expect(response.body).to(include(''))
      end
    end
  end
end
