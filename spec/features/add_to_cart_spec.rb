require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add product to cart" do
     # ACT
     visit root_path
     first(:button,'Add').click
     # DEBUG / VERIFY
    within('nav') {expect(page).to have_content('My Cart (0)')}
    sleep(2)
    save_screenshot
  end
end


# page.find('article.product footer').first(:button,'Add').click