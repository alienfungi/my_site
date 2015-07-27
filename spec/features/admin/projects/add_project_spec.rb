require 'rails_helper'

describe 'adding projects' do
  include AuthHelper

  let!(:user) { User.create(email: 'email@example.com', password: 'password') }

  before(:each) do
    log_in_as(user, { password: 'password' })
    visit admin_root_path
    click_link 'Projects'
    click_link 'New'
  end

  describe 'with valid input' do
    before(:each) do
      fill_in 'Name', with: 'Search Engine'
      fill_in 'Description', with: 'Replacing Google one result at a time.'
      fill_in 'Link', with: 'http://www.example.com'
      fill_in 'Source link', with: 'http://www.example.com'
      click_on 'Save'
    end

    it 'redirects to the projects index' do
      expect(current_path).to eq(admin_projects_path)
    end

    it 'displays a success message' do
      expect(page).to have_content('Successfully created "Search Engine"')
    end

    it 'displays the project in the projects list' do
      visit admin_projects_path
      expect(page).to have_content('Search Engine')
      expect(page).to have_content('Replacing Google')
    end
  end

  describe 'with incomplete input' do
    before(:each) do
      click_on 'Save'
    end

    it 'displays a failure message' do
      expect(page).to have_content('Failed to create project')
    end

    it "adds an error to name" do
      field_group = find(".project_name.has-error")
      expect(field_group).to have_content("can't be blank")
    end

    it "adds an error to description" do
      field_group = find(".project_description.has-error")
      expect(field_group).to have_content("can't be blank")
    end
  end
end
