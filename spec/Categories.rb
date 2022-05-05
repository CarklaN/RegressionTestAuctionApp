require 'rspec'
require 'watir'
require 'elements/Objects'

describe 'Test Categories and Subcategories' do
    before :all do
        @browser = Watir::Browser.new:chrome
        @browser.window.maximize
        @browser.goto('https://auction-app-react.herokuapp.com/')
        sleep 5
    end

    after :all do
        @browser.close
    end

    context 'Test categories response' do

    	it 'Fashion category' do 
    		Objects.fashion(@browser)
    		sleep 2
    		expect(@browser.url).to eql($fashion_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    	it 'Accessories category' do 
    		Objects.accessories(@browser)
    		sleep 2
    		expect(@browser.url).to eql($accessories_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    	it 'Jewellery category' do
    		Objects.jewellery(@browser)
    		sleep 2
    		expect(@browser.url).to eql($jewellery_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    	it 'Shoes category' do 
    		Objects.shoes(@browser)
    		sleep 2
    		expect(@browser.url).to eql($shoes_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    	it 'Sportswear category' do 
    		Objects.sportswear(@browser)
    		sleep 2
    		expect(@browser.url).to eql($sportswear_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    	it 'Home category' do 
    		Objects.home(@browser)
    		sleep 2
    		expect(@browser.url).to eql($home_path)
            sleep 1
            Objects.homePage(@browser)
        end

    	it 'Electronics category' do 
    		Objects.electronics(@browser)
    		sleep 2
    		expect(@browser.url).to eql($electronics_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    	it 'Cars category' do 
    		Objects.cars(@browser)
    		sleep 2
    		expect(@browser.url).to eql($cars_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    	it 'Movies category' do 
    		Objects.movies(@browser)
    		sleep 2
    		expect(@browser.url).to eql($movies_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    	it 'All Categories category' do 
    		Objects.allCategories(@browser)
    		sleep 2
    		expect(@browser.url).to eql($allCategories_path)
            sleep 1
            Objects.homePage(@browser)
    	end

    end

end