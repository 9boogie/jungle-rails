class Admin::DashboardController < ApplicationController
  admin_name=ENV['AUTHENTICATION_USERNAME']
  admin_password=ENV['AUTHENTICATION_PASSWORD']

  http_basic_authenticate_with name: admin_name, password: admin_password
  
  def show
    @products = Product.all.order(created_at: :desc)
    @category = Category.all
  end
end
