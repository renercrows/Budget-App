require 'rails_helper'

RSpec.describe '_background.html.rb', type: :feature do
  context 'Write tests for group list page' do
    it 'should have Sign in link' do
      visit new_user_session_path
      expect(page).to have_content('Sign in')
    end

    it 'should have Sign up link' do
      visit new_user_session_path
      expect(page).to have_content('Sign up')
    end
  end
end
