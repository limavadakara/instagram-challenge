require 'rails_helper'
feature 'As a person wanting to use Instagram' do

  scenario 'I can sign up' do
    visit '/users/sign_up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'Welcome123'
    fill_in 'user_password_confirmation', with: 'Welcome123'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome to Instagram'
  end

  scenario 'I can sign in if I already have an account' do
    User.create(email: 'test@test.com', password: 'Welcome123')
    visit '/users/sign_in'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'Welcome123'
    click_button 'Log in'
    expect(page).to have_content 'Welcome to Instagram'
  end

  scenario 'I will be redirected to sign if when visiting Instagram if I am not signed in' do
    visit '/'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_button 'Log in'
  end
end
