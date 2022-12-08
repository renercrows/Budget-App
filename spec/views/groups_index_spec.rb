require 'rails_helper'

RSpec.describe 'Group Index', type: :feature do
  context 'Write tests for group list page' do
    it 'displays the add new category' do
      visit new_group_path
      expect(page).to have_content('Sign in')
    end

    it 'displays the message of no categories' do
      visit new_user_session_path
      expect(page).to have_content('Sign up')
    end
  end
end
