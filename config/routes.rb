Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products_path" => "products#all_products_method"
    get "/first_product_path" => "products#first_product_method"
    get "/second_product_path" => "products#second_product_method"
    get "/third_product_path" => "products#third_product_method"
  end
end
