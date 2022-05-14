require 'helper'
require 'elements/page_container'

class Objects < HomePage

$fashion_path='https://auction-app-react.herokuapp.com/shop/categories/1'
$accessories_path='https://auction-app-react.herokuapp.com/shop/categories/2'
$jewellery_path='https://auction-app-react.herokuapp.com/shop/categories/3'
$shoes_path='https://auction-app-react.herokuapp.com/shop/categories/4'
$sportswear_path='https://auction-app-react.herokuapp.com/shop/categories/5'
$home_path='https://auction-app-react.herokuapp.com/shop/categories/6'
$electronics_path='https://auction-app-react.herokuapp.com/shop/categories/7'
$cars_path='https://auction-app-react.herokuapp.com/shop/categories/8'
$movies_path='https://auction-app-react.herokuapp.com/shop/categories/9'
$all_categories_path='https://auction-app-react.herokuapp.com/shop/categories/search'

#social media
$facebook='https://www.facebook.com/magicpojska/'
$instagram='https://www.instagram.com/accounts/login/?next=/magic_pojska/'
$twitter='https://twitter.com/magicpojska'

#HOME PAGE

def home_page
	@browser.goto('https://auction-app-react.herokuapp.com/')
end

#METHODS FOR Categories.rb

def fashion
	@browser.a(visible_text: "Fashion").click
end

def accessories
	@browser.a(text: "Accessories").click
end

def jewellery
	@browser.a(text: "Jewellery").click
end

def shoes
	@browser.a(text: "Shoes").click
end

def sportswear
	@browser.a(text: "Sportswear").click
end

def home
	@browser.a(text: "HOME").click
end

def electronics
	@browser.a(text: "Electronics").click
end

def cars
	@browser.a(text: "Cars").click
end

def movies
	@browser.a(text: "Movies").click
end

def all_categories
	@browser.a(text: "All Categories").click
end

#METHODS FOR Sorting.rb

def shop_page
	@browser.a(text: "SHOP").click
end

def default_sorting
	@browser.div(class: " css-1d8n9bt").click
	sleep 0.1
	@browser.div(text: "Added: New to Old").click
end

def new_to_old_sorting
	@browser.div(class: " css-1d8n9bt").click
	sleep 0.1
	@browser.div(text: "Added: New to Old").click
end

def time_left_sorting
	@browser.div(class: " css-1d8n9bt").click
	sleep 0.1
	@browser.div(text: "Time left").click
end

def price_low_to_high_sorting
	@browser.div(class: " css-1d8n9bt").click
	sleep 0.1
	@browser.div(text: "Price: Low to High").click
end

def price_high_to_low_sorting
	@browser.div(class: " css-1d8n9bt").click
	sleep 0.1
	@browser.div(text: "Price: High to Low").click
end

def type_price_range(lowerPrice, higherPrice)
	@browser.input(placeholder: "$5").set lowerPrice
	@browser.input(xpath: "/html/body/div/div/div/div/div[1]/div[2]/div[1]/div[2]/input").set higherPrice
end

def scroll_price_range(minValue, maxValue)
	@browser.input(value: "5").set minValue
	@browser.input(value: "1000000").set maxValue
end

#PROFILE EDITING METHODS

def login(email, password)
	@browser.a(text: "Login").click
	sleep 1
	@browser.input(placeholder: "user@domain.com").click
	sleep 0.3
	@browser.input(placeholder: "user@domain.com").set email
	@browser.input(placeholder: "*********").set password
	@browser.button(text: "LOGIN").click
end

def logout
	@browser.button(text: "Logout").click
end

def my_account
	@browser.a(text:"MY ACCOUNT").click
	sleep 1
end

def set_first_and_last_name(firstName, lastName)
	@browser.input(placeholder: "John").set firstName
	@browser.input(placeholder: "Doe") .set lastName
end

def set_birth_date(year, month, day)
	@browser.div(xpath: "/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[1]/div/div[1]/div").click
	@browser.div(text: "#{year}").click
	@browser.div(xpath:  "/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[2]/div/div[1]/div").click
	@browser.div(text: "#{month}").click
	@browser.div(xpath: "/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[3]/div/div[1]/div").click
	@browser.div(text: "#{day}").click
end 

def set_phone_number(phone)
	@browser.input(placeholder: "+32534231564").set phone 
end

def shipping_optional
	@browser.h2(xpath: "/html/body/div/div/div[2]/div[2]/div[2]/h2").click
end

def street(streetAddress)
	@browser.input(placeholder:"123 Main Street").set streetAddress 
end

def city(city)
	@browser.input(placeholder: "eg. Madrid").set city 
end

def zip_code(zip_code)
	@browser.input(placeholder: "XXXXXX").set zip_code
end

def state(state)
	@browser.input(placeholder: "eg. Asturias").set state 
end

def country(country)
	@browser.div(class: " css-ackcql").click
	@browser.div(text: "#{country}").click
end

def upload_photo(filePath)
    @browser.label(:text => 'Change photo').file_field(:index =>0).wait_until(&:enabled?).set(filePath)
    #https://onesoftwaretester.wordpress.com/2017/03/14/uploading-images-in-watir-6-0-2/
end

def save_info
	@browser.button(text: "SAVE INFO").click
end

#MY ACCOUNT ELEMENTS

def seller_page
	@browser.a(xpath: "/html/body/div/div/div[2]/div[1]/div/div[2]/a").double_click
end

def bids_page 
	@browser.a(xpath: "/html/body/div/div/div[2]/div[1]/div/div[3]/a").click
end

def wishlist
	@browser.a(xpath: "/html/body/div/div/div[2]/div/div/div[4]/a").click
end

def settings
	@browser.a(xpath: "/html/body/div/div/div[2]/div[1]/div/div[5]/a").click
end

#HOME PAGE ELEMENTS

def logo_icon
	@browser.img(src:"/images/auction-app-logo.png").click
end

def facebook_header
	@browser.a(href: "https://www.facebook.com/magicpojska/").click
end

def instagram_header
	@browser.a(href: "https://www.instagram.com/magic_pojska/").click
end

def twitter_header
	@browser.a(href: "https://twitter.com/magicpojska").click
end

def search_bar(input)
	@browser.input(placeholder: "Try enter: Shoes").set input
	@browser.button(xpath:"/html/body/div/div/header/div[2]/div/form/div/button").click
end

def facebook_footer
	@browser.div(xpath: "/html/body/div/div/footer/div[2]/ul/li[3]/div").a(href: "https://www.facebook.com/magicpojska/").click
end

def instagram_footer
	@browser.div(xpath: "/html/body/div/div/footer/div[2]/ul/li[3]/div").a(href: "https://www.instagram.com/magic_pojska/").click
end

def twitter_footer
	@browser.div(xpath: "/html/body/div/div/footer/div[2]/ul/li[3]/div").a(href: "https://twitter.com/magicpojska").click
end

def terms_and_conditions
	@browser.a(text: "Terms and Conditions").click
end

def about_us
	@browser.a(text: "About Us").click
end

def privacy_policy
	@browser.a(text: "Privacy and Policy").click
end

end