require 'rspec'
require 'watir'
require 'helper'
require 'elements/objects'
require 'shared_context/login_shared'

describe 'Test sorting options available on SHOP page' do
    
    let(:actions) {@main.methods}

    context 'Check sorting options' do 

        it 'Open SHOP page' do 
            actions.shop_page
            sleep 1
        end

        it 'Default Sorting check' do 
            actions.new_to_old_sorting
            sleep 2
            @browser.screenshot.save './screenshots/default_sorting.png'
        end

        it 'Added: New to Old check' do 
            actions.new_to_old_sorting
            sleep 2
            @browser.screenshot.save './screenshots/newToOld.png'
        end

        it 'Time left check' do 
            actions.time_left_sorting
            sleep 2
            @browser.screenshot.save './screenshots/timeLeft.png'
        end

        it 'Price: Low to High check' do 
            actions.price_low_to_high_sorting
            sleep 2
            @browser.screenshot.save './screenshots/lowToHigh.png'
        end

        it 'Price: High to Low check' do 
            actions.price_high_to_low_sorting
            sleep 2
            @browser.screenshot.save './screenshots/highToLow.png'
        end

        it 'Price range - type check' do 
            actions.type_price_range(8, 150000)
            sleep 2
            @browser.screenshot.save './screenshots/priceRange.png'
        end

    end
    
end