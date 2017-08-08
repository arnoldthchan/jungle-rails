require 'rails_helper'

RSpec.feature "Visitor Adds Product to Cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(1),
        description: Faker::Hipster.paragraph(2),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see cart now displays (1)" do
    # ACT
    visit root_path
    find_link(href: '/cart/add_item?product_id=1').click

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content " My Cart (1) "

  end

end
