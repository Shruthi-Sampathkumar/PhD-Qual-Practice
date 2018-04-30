require 'rails_helper'

RSpec.describe PracticeController, type: :controller do
  
  describe "params check" do
    let!(:params) { {question_bank: {question: 'Test', category: 'cat1', option1: '1', option2: '2', option3: '3', option4: '4', option5: '5', answer: '2'}} }
    it 'tests strong paramters' do
      p = PracticeController.new
      expect(p).to receive(:question_params)
      p.question_params
    end
  end
  
  #index
  describe 'questions for practice' do
    let!(:question1) { FactoryBot.create(:question_bank, question: 'Test Question1', category: 'cat1', option1: '1', option2: '2', option3: '3', option4: '4', option5: '5', answer: '2')}
    let!(:question2) { FactoryBot.create(:question_bank, question: 'Test Question2', category: 'cat2', option1: '1', option2: '2', option3: '3', option4: '4', option5: '5', answer: '3')}
    let(:params) { {categories: {'cat1' => "1"}} }
    it 'get questions of a given category' do
      get :index, categories: {'cat1'=>"1"}
      expect(assigns(:questions)).not_to include(question2)
    end
  end
  
end
