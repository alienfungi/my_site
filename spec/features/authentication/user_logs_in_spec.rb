require 'rails_helper'

describe 'user logs in' do
  let!(:user) { User.create(email: 'email@example.com', password: 'password') }

  before(:each) do
    visit login_path
  end

  describe 'with valid credentials' do
    before(:each) do
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it 'redirects to the admin homepage' do
      expect(current_path).to eq(admin_path)
    end

    it 'displays a link to log out' do
      expect(page).to have_link('Log out')
    end
  end

  describe 'with invalid credentials' do
    before(:each) do
      fill_in 'Email', with: 'wrong@example.com'
      fill_in 'Password', with: 'not_the_password'
      click_on 'Log in'
    end

    it 'renders the login form' do
      expect(page).to have_title('Log in')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end
  end
end
