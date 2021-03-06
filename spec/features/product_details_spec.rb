require 'rails_helper'

RSpec.feature "Visitor navigates to specific product page", type: :feature, js: true do

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

  scenario "They see the product they selected" do
    # ACT
    visit root_path
    find_link('Details »',class: 'btn', href: '/products/1').click
    sleep 3

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css 'article.product-detail', count: 1

  end

end
