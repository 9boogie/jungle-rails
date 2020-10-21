require 'rails_helper'

RSpec.feature "Visitor navigate and clicking show the product detail", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    5.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    visit root_path

    first('article.product').find('header').click
    find('section.products-show').visible?
    find('img').visible?

    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')


    save_screenshot
  end
end
