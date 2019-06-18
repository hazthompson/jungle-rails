require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "redirected to product page on click " do
    visit root_path
    # puts page.all(:css, '.products')
    first(:link,'Details').click  #as there is more than one details button so need to be specfi
    
    puts page.html
    expect(page).to have_css 'article.product', count: 10
    sleep(2)
    save_screenshot
  end

end
