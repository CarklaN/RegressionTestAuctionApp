require 'watir'
require 'helper'
require 'elements/objects'
require 'shared_context/login_shared'

describe 'My Account editing' do

    let(:actions) { @main.methods }

    include_context 'Login' , "mark44@gmail.com", "bbb" 

    context 'Personal information editing' do 

        it 'Open My Account page' do 
            actions.my_account
            sleep 2
        end

        it 'Upload picture' do 
            actions.upload_photo("/home/nikola/Desktop/RegressionAuctionApp/spec/photos/person.jpg")
           
            sleep 4
        end
        
        it 'Type First and Last Name' do 
            actions.set_first_and_last_name("Mark","Marks")
        end

        it 'Pick up birth day' do 
            actions.set_birth_date(1990,10,1)
            sleep 1
        end

        it 'Set phone number' do 
            actions.set_phone_number(12345678)
        end

        it 'Shipping Address (Optional) clickability' do 
            actions.shipping_optional
        end

        it 'Type Street' do 
            actions.street("Main St 890")
        end

        it 'Type City' do 
            actions.city("Lake George")
        end

        it 'Type Zip Code' do 
            actions.zip_code(12345)
        end

        it 'Type State' do 
            actions.state("New York")
        end

        it 'Choose Country' do 
            actions.country("Bosnia and Herzegovina")
        end

        it 'Save info button' do 
           actions.save_info
           sleep 1
        end

        it 'Refresh page and take screenshot of saved edits' do 
            actions.my_account
            sleep 2
            @browser.screenshot.save './screenshots/profileEdits1.png'
            sleep 1
            actions.shipping_optional
            actions.shipping_optional #double method necessary to open dropdown menu
            @browser.scroll.to :bottom
            sleep 2
            @browser.screenshot.save './screenshots/profileEdits2.png'
        end

    end

end