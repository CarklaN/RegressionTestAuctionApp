require 'watir'
class Objects 

$fashion_path='https://auction-app-react.herokuapp.com/shop/categories/1'
$accessories_path='https://auction-app-react.herokuapp.com/shop/categories/2'
$jewellery_path='https://auction-app-react.herokuapp.com/shop/categories/3'
$shoes_path='https://auction-app-react.herokuapp.com/shop/categories/4'
$sportswear_path='https://auction-app-react.herokuapp.com/shop/categories/5'
$home_path='https://auction-app-react.herokuapp.com/shop/categories/6'
$electronics_path='https://auction-app-react.herokuapp.com/shop/categories/7'
$cars_path='https://auction-app-react.herokuapp.com/shop/categories/8'
$movies_path='https://auction-app-react.herokuapp.com/shop/categories/9'
$allCategories_path='https://auction-app-react.herokuapp.com/shop/categories/search'

#social media
$facebook='https://www.facebook.com/magicpojska/'
$instagram='https://www.instagram.com/accounts/login/?next=/magic_pojska/'
$twitter='https://twitter.com/magicpojska'

#HOME PAGE

def self.homePage(driver)
	driver.goto('https://auction-app-react.herokuapp.com/')
end

#METHODS FOR Categories.rb

def self.fashion(driver)
	driver.a(visible_text: "Fashion").click
end

def self.accessories(driver)
	driver.a(text: "Accessories").click
end

def self.jewellery(driver)
	driver.a(text: "Jewellery").click
end

def self.shoes(driver)
	driver.a(text: "Shoes").click
end

def self.sportswear(driver)
	driver.a(text: "Sportswear").click
end

def self.home(driver)
	driver.a(text: "HOME").click
end

def self.electronics(driver)
	driver.a(text: "Electronics").click
end

def self.cars(driver)
	driver.a(text: "Cars").click
end

def self.movies(driver)
	driver.a(text: "Movies").click
end

def self.allCategories(driver)
	driver.a(text: "All Categories").click
end

#METHODS FOR Sorting.rb

def self.shopPage(driver)
	driver.a(text: "SHOP").click
end

def self.defaultSorting(driver)
	driver.div(class: " css-1d8n9bt").click
	sleep 0.1
	driver.div(text: "Added: New to Old").click
end

def self.newToOldSorting(driver)
	driver.div(class: " css-1d8n9bt").click
	sleep 0.1
	driver.div(text: "Added: New to Old").click
end

def self.timeLeftSorting(driver)
	driver.div(class: " css-1d8n9bt").click
	sleep 0.1
	driver.div(text: "Time left").click
end

def self.priceLowToHighSorting(driver)
	driver.div(class: " css-1d8n9bt").click
	sleep 0.1
	driver.div(text: "Price: Low to High").click
end

def self.priceHighToLowSorting(driver)
	driver.div(class: " css-1d8n9bt").click
	sleep 0.1
	driver.div(text: "Price: High to Low").click
end

def self.typePriceRange(driver, lowerPrice, higherPrice)
	driver.input(placeholder: "$5").set lowerPrice
	driver.input(placeholder: "$1000000").set higherPrice
end

def self.scrollPriceRange(driver, minValue, maxValue)
	driver.input(value: "5").set minValue
	driver.input(value: "1000000").set maxValue
end

#PROFILE EDITING METHODS

def self.login(driver, email, password)
	driver.a(text: "Login").click
	sleep 1
	driver.input(placeholder: "user@domain.com").set email
	driver.input(placeholder: "*********").set password
	driver.button(text: "LOGIN").click
end

def self.logout(driver)
	driver.button(text: "Logout").click
end

def self.myAccount(driver)
	driver.a(text:"MY ACCOUNT").click
	sleep 1
end

def self.setFirstAndLastName(driver, firstName, lastName)
	driver.input(placeholder: "John").set firstName
	driver.input(placeholder: "Doe") .set lastName
end

def self.setBirthDate(driver, year, month, day)
	driver.div(xpath: "/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[1]/div/div[1]/div").click
	driver.div(text: "#{year}").click
	driver.div(xpath:  "/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[2]/div/div[1]/div").click
	driver.div(text: "#{month}").click
	driver.div(xpath: "/html/body/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[3]/div/div[1]/div").click
	driver.div(text: "#{day}").click
end 

def self.setPhoneNumber(driver, phone)
	driver.input(placeholder: "+32534231564").set phone 
end

def self.ShippingOptional(driver)
	driver.h2(xpath: "/html/body/div/div/div[2]/div[2]/div[2]/h2").click
end

def self.street(driver, streetAddress)
	driver.input(placeholder:"123 Main Street").set streetAddress 
end

def self.city(driver, city)
	driver.input(placeholder: "eg. Madrid").set city 
end

def self.zipCode(driver, zipCode)
	driver.input(placeholder: "XXXXXX").set zipCode
end

def self.state(driver, state)
	driver.input(placeholder: "eg. Asturias").set state 
end

def self.country(driver, country)
	driver.div(class: " css-ackcql").click
	driver.div(text: "#{country}").click
end

def self.uploadPhoto(driver, filePath)
    driver.label(:text => 'Change photo').file_field(:index =>0).wait_until(&:enabled?).set(filePath)
    #https://onesoftwaretester.wordpress.com/2017/03/14/uploading-images-in-watir-6-0-2/
end

def self.saveInfo(driver)
	driver.button(text: "SAVE INFO").click
end

#MY ACCOUNT ELEMENTS

def self.sellerPage(driver)
	driver.a(xpath: "/html/body/div/div/div[2]/div[1]/div/div[2]/a").double_click
end

def self.bidsPage(driver) 
	driver.a(xpath: "/html/body/div/div/div[2]/div[1]/div/div[3]/a").click
end

def self.wishlist(driver)
	driver.a(xpath: "/html/body/div/div/div[2]/div/div/div[4]/a").click
end

def self.settings(driver)
	driver.a(xpath: "/html/body/div/div/div[2]/div[1]/div/div[5]/a").click
end

#HOME PAGE ELEMENTS

def self.logoIcon(driver)
	driver.img(src:"/images/auction-app-logo.png").click
end

def self.facebookHeader(driver)
	driver.a(href: "https://www.facebook.com/magicpojska/").click
end

def self.instagramHeader(driver)
	driver.a(href: "https://www.instagram.com/magic_pojska/").click
end

def self.twitterHeader(driver)
	driver.a(href: "https://twitter.com/magicpojska").click
end

def self.searchBar(driver, input)
	driver.input(placeholder: "Try enter: Shoes").set input
	driver.button(xpath:"/html/body/div/div/header/div[2]/div/form/div/button").click
end

def self.facebookFooter(driver)
	driver.div(xpath: "/html/body/div/div/footer/div[2]/ul/li[3]/div").a(href: "https://www.facebook.com/magicpojska/").click
end

def self.instagramFooter(driver)
	driver.div(xpath: "/html/body/div/div/footer/div[2]/ul/li[3]/div").a(href: "https://www.instagram.com/magic_pojska/").click
end

def self.twitterFooter(driver)
	driver.div(xpath: "/html/body/div/div/footer/div[2]/ul/li[3]/div").a(href: "https://twitter.com/magicpojska").click
end

def self.termsAndConditions(driver)
	driver.a(text: "Terms and Conditions").click
end

def self.aboutUs(driver)
	driver.a(text: "About Us").click
end

def self.privacyPolicy(driver)
	driver.a(text: "Privacy and Policy").click
end

end