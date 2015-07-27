require 'rails_helper'

describe 'user logs out' do
  include AuthHelper

  let!(:user) { User.create(email: 'email@example.com', password: 'password') }

  before(:each) do
    log_in_as(user, { password: 'password' })
    visit admin_root_path
    click_link 'Log out'
  end

  it 'redirects to the homepage' do
    expect(current_path).to eq(root_path)
  end

  it 'no longer allows me to visit logged in only paths' do
    expect { visit admin_root_path }.to raise_error(ActionController::RoutingError)
  end
end
