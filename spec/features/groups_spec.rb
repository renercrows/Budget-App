require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before(:each) do
    User.create(name: 'Steve', email: 'steve@example.com', password: '123456', password_confirmation: '123456')
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'steve@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Sign in'
  end

  it 'should show the categories index page' do
    expect(page).to have_content('Categories')
  end

  it 'should not have any categories yet' do
    expect(page).to have_content("You don't have any categories yet.")
  end

  it 'should show the new category page' do
    click_link 'Add a new category'
    expect(page).to have_content('Create a new category:')
  end
end
