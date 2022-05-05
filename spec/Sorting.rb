require 'rspec'
require 'watir'
require 'elements/Objects'

describe 'Test sorting options available on SHOP page' do
    before :all do
        @browser = Watir::Browser.new:chrome
        @browser.window.maximize
        @browser.goto('https://auction-app-react.herokuapp.com/')
        sleep 3
    end

    after :all do
        @browser.close
    end

    context 'Check sorting options' do 

        it 'Open SHOP page' do 
            Objects.shopPage(@browser)
            sleep 1
        end

        it 'Default Sorting check' do 
            Objects.newToOldSorting(@browser)
            sleep 1
            @browser.screenshot.save './screenshots/defaultSorting.png'
        end

        it 'Added: New to Old check' do 
            Objects.newToOldSorting(@browser)
            @browser.screenshot.save './screenshots/newToOld.png'
        end

        it 'Time left check' do 
            Objects.timeLeftSorting(@browser)
            @browser.screenshot.save './screenshots/timeLeft.png'
        end

        it 'Price: Low to High check' do 
            Objects.priceLowToHighSorting(@browser)
            @browser.screenshot.save './screenshots/lowToHigh.png'
        end

        it 'Price: High to Low check' do 
            Objects.priceHighToLowSorting(@browser)
            @browser.screenshot.save './screenshots/highToLow.png'
        end

        it 'Price range - type check' do 
            Objects.typePriceRange(@browser, 8, 150000)
            @browser.screenshot.save './screenshots/priceRange.png'
        end

    end
    
end