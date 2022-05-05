require 'rspec'
require 'watir'
require 'capybara'
require 'elements/Objects'

describe 'My Account editing' do
    before :all do
        @browser = Watir::Browser.new:chrome
        @browser.window.maximize
        @browser.goto('https://auction-app-react.herokuapp.com/')
        sleep 5
        Objects.login(@browser, "mark44@gmail.com", "bbb")
        sleep 1
        Objects.myAccount(@browser)
    end

    after :all do
        @browser.close
    end

    context 'Personal information editing' do 

        it 'Upload picture' do 
            Objects.uploadPhoto(@browser, "/home/nikola/Desktop/RegressionAuctionApp/spec/photos/person.jpg")
           
            sleep 4
        end
        
        it 'Type First and Last Name' do 
            Objects.setFirstAndLastName(@browser, "Mark","Marks")
        end

        it 'Pick up birth day' do 
            Objects.setBirthDate(@browser, 1990,10,1)
            sleep 1
        end

        it 'Set phone number' do 
            Objects.setPhoneNumber(@browser, 12345678)
        end

        it 'Shipping Address (Optional) clickability' do 
            Objects.ShippingOptional(@browser)
        end

        it 'Type Street' do 
            Objects.street(@browser, "Main St 890")
        end

        it 'Type City' do 
            Objects.city(@browser, "Lake George")
        end

        it 'Type Zip Code' do 
            Objects.zipCode(@browser, 12345)
        end

        it 'Type State' do 
            Objects.state(@browser, "New York")
        end

        it 'Choose Country' do 
            Objects.country(@browser, "Bosnia and Herzegovina")
        end

        it 'Save info button' do 
           Objects.saveInfo(@browser)
           sleep 1
        end

        it 'Refresh page and take screenshot of saved edits' do 
            Objects.myAccount(@browser)
            sleep 2
            @browser.screenshot.save './screenshots/profileEdits1.png'
            sleep 1
            Objects.ShippingOptional(@browser)
            Objects.ShippingOptional(@browser) #double method necessary to open dropdown menu
            @browser.scroll.to :bottom
            sleep 2
            @browser.screenshot.save './screenshots/profileEdits2.png'
        end

    end

end