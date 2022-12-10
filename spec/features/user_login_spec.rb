require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  before(:each) do
    User.create(name: 'Steve', email: 'steve@example.com', password: '123456', password_confirmation: '123456')
  end

  it 'should login successfully' do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'steve@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Sign in'
    expect(page).to have_content('Categories')
  end

  it 'error because email/password are wrong' do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'steve@example.com'
    fill_in 'Password', with: 'wrong_password'
    click_button 'Sign in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
