require 'rails_helper'

describe 'adding certifications' do
  include AuthHelper

  let!(:user) { User.create(email: 'email@example.com', password: 'password') }

  before(:each) do
    log_in_as(user, { password: 'password' })
    visit admin_root_path
    click_link 'Certifications'
    click_link 'New'
  end

  describe 'with valid input' do
    before(:each) do
      fill_in 'Name', with: 'Professional'
      fill_in 'Organization', with: 'Certification Bureau'
      date = Date.today
      select date.year, from: 'certification_date_acquired_1i'
      select Date::MONTHNAMES[date.month], from: 'certification_date_acquired_2i'
      select date.day, from: 'certification_date_acquired_3i'
      fill_in 'Score', with: '100%'
      click_on 'Save'
    end

    it 'redirects to the certifications index' do
      expect(current_path).to eq(admin_certifications_path)
    end

    it 'displays a success message' do
      expect(page).to have_content('Successfully created "Professional"')
    end

    it 'displays the certification in the certifications list' do
      visit admin_certifications_path
      expect(page).to have_content('Professional')
      expect(page).to have_content('Certification Bureau')
    end
  end

  describe 'with incomplete input' do
    before(:each) do
      click_on 'Save'
    end

    it 'displays a failure message' do
      expect(page).to have_content('Failed to create certification')
    end

    %w(organization name).each do |field|
      it "adds an error to #{ field }" do
        field_group = find(".certification_#{ field }.has-error")
        expect(field_group).to have_content("can't be blank")
      end
    end
  end
end
