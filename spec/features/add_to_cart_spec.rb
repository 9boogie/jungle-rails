require 'rails_helper'

RSpec.feature "Add to the Cart increase the cart by one", type: :feature, js: true do
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

    expect(page).to have_content('My Cart (0)')

    first("article.product").find_button('Add').click
    expect(page).to have_content('My Cart (1)')

    save_screenshot
  end
end