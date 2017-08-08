require 'rails_helper'

RSpec.feature "Visitor Logs in", type: :feature, js: true do

  # SETUP
  before :each do
    User.create!({
      first_name: "Pineapple",
      last_name: "Pineapple",
      email: "Pineapple@Pineapple.com",
      password: "Pineapple",
      password_confirmation: "Pineapple"
    })
  end

  scenario "They should see their name on signin" do
    # ACT
    visit root_path
    find_link(href: '/session/new').click

    fill_in 'email', with: 'Pineapple@Pineapple.com'
    fill_in 'password', with: 'Pineapple'
    find('input[name="commit"][value="Login"]').click

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content "Signed in as Pineapple"

  end

end
