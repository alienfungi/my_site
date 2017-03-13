require 'rails_helper'

describe 'user logs out' do
  include AuthHelper

  let!(:user) { User.create(email: 'email@example.com', password: 'password') }

  before(:each) do
    log_in_as(user, { password: 'password' })
    visit admin_root_path
    click_link 'Logout'
  end

  it 'redirects to the homepage' do
    expect(current_path).to eq(root_path)
  end

  it 'no longer treats me like an admin' do
    visit admin_root_path
    expect(page).to have_content('Welcome, guest.')
  end
end
