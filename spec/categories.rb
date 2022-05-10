require 'rspec'
require 'watir'
require 'helper'
require 'elements/objects'
require 'shared_context/login_shared'

describe 'Test Categories and Subcategories' do

    let(:actions) {@main.methods}

    context 'Test categories response' do

    	it 'Fashion category' do 
    		actions.fashion
    		sleep 2
    		expect(@browser.url).to eql($fashion_path)
            sleep 1
            actions.home_page
    	end

    	it 'Accessories category' do 
    		actions.accessories
    		sleep 2
    		expect(@browser.url).to eql($accessories_path)
            sleep 1
            actions.home_page
    	end

    	it 'Jewellery category' do
    		actions.jewellery
            sleep 2
    		expect(@browser.url).to eql($jewellery_path)
            sleep 1
            actions.home_page
    	end

    	it 'Shoes category' do 
    		actions.shoes
    		sleep 2
    		expect(@browser.url).to eql($shoes_path)
            sleep 1
            actions.home_page
    	end

    	it 'Sportswear category' do 
    		actions.sportswear
    		sleep 2
    		expect(@browser.url).to eql($sportswear_path)
            sleep 1
            actions.home_page
    	end

    	it 'Home category' do 
    		actions.home
    		sleep 2
    		expect(@browser.url).to eql($home_path)
            sleep 1
            actions.home_page
        end

    	it 'Electronics category' do 
    		actions.electronics
    		sleep 2
    		expect(@browser.url).to eql($electronics_path)
            sleep 1
            actions.home_page
    	end

    	it 'Cars category' do 
    		actions.cars
    		sleep 2
    		expect(@browser.url).to eql($cars_path)
            sleep 1
            actions.home_page
    	end

    	it 'Movies category' do 
    		actions.movies
    		sleep 2
    		expect(@browser.url).to eql($movies_path)
            sleep 1
            actions.home_page
    	end

    	it 'All Categories category' do 
    		actions.all_categories
    		sleep 2
    		expect(@browser.url).to eql($all_categories_path)
            sleep 1
            actions.home_page
    	end

    end

end