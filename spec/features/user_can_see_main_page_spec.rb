require 'rails_helper'
feature 'As a user I can' do
  scenario 'See the Welcome Message when I visit the Main Page' do
    visit '/'
    expect(page).to have_content "Welcome to Instagram"
  end
end
