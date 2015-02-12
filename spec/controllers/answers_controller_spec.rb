require 'rails_helper'

describe AnswersController do
  describe 'GET #show' do
    it "renders the :show template for the answer" do
      # let() is the preferred way to generate instances within tests
      # let(:question) { create(:question) }
      question = create(:question)
      answer = create(:answer)
      get :show, id: answer, question_id: question.id
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    xit "assigns a new Answer to @answer"
    xit "renders the :new template"
  end

  describe 'GET #edit' do
    xit "assigns the requested answer to @answer"
    xit "renders the :edit template"
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      xit "saves the new answer in the database"
      xit "redirects to the answer's question#show"
    end

    context 'with invalid attributes' do
      xit "does not save the new answer in the database"
      xit "re-renders the :new template"
    end
  end

  describe 'PATCH #update' do
    context "with valid attributes" do
      xit "updates the answer in the database"
      xit "redirects to the answer's question#show"
    end

    context "with invalid attributes" do
      xit "does not update the answer in the database"
      xit "re-renders the :edit template"
    end
  end

  describe 'DELETE #destroy' do
    xit "deletes the answer from the database"
    xit "redirects to answer's question#show"
  end
end
