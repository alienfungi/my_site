require 'rails_helper'

describe 'user logs in' do
  let!(:user) { FactoryBot.create(:user, email: 'email@example.com', password: 'password') }

  before(:each) do
    visit login_path
  end

  describe 'with valid credentials' do
    before(:each) do
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'password'
      click_on 'Login'
    end

    it 'redirects to the admin homepage' do
      expect(current_path).to eq(admin_root_path)
    end

    it 'treats me like an admin' do
      expect(page).to have_content('Welcome, administrator.')
    end

    it 'displays a link to log out' do
      expect(page).to have_link('Logout')
    end
  end

  describe 'with invalid credentials' do
    before(:each) do
      fill_in 'Email', with: 'wrong@example.com'
      fill_in 'Password', with: 'not_the_password'
      click_on 'Login'
    end

    it 'renders the login form' do
      expect(page).to have_title('Login')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end
  end
end
