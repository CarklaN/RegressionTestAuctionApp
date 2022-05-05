require 'roo'
require 'rspec'
require 'watir'
require 'elements/Objects'

LOGIN_URL='https://auction-app-react.herokuapp.com/login'

#https://stackoverflow.com/questions/41078472/using-roo-with-rubyrails-to-parse-excel

describe 'Clickability of elements on the home page, searchbar functionality and My Account options' do
    before :all do
        @browser = Watir::Browser.new:chrome
        @browser.window.maximize
        @browser.goto('https://auction-app-react.herokuapp.com/')
        sleep 5
    end

    after :all do
        @browser.close
    end

    context 'Login with already preapred login credentials' do 

        it 'List of credentials from excel file' do 

        data = Roo::Spreadsheet.open('./spec/data/invalidLoginCredentials.xlsx')
        
         for i in 2..data.last_row do

            email=data.cell('A', i)
            password=data.cell('B', i)

            Objects.login(@browser, email, password)

            sleep 1

            if(@browser.url!=LOGIN_URL)

                acceptedCredentials="acceptedCredentials#{i}"
                @browser.screenshot.save "./screenshots/#{acceptedCredentials}.png"
                  
                puts "Login information that passed: email: #{email} and password: #{password}."

                Objects.logout(@browser)

            end

         end

    end

    end

end
