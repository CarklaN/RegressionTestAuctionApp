require 'watir'
require 'roo'
require 'helper'
require 'elements/objects'

LOGIN_URL='https://auction-app-react.herokuapp.com/login'

#https://stackoverflow.com/questions/41078472/using-roo-with-rubyrails-to-parse-excel

describe 'Using external file for login automation' do

    let(:actions) { @main.methods }

    context 'Login automation with credentials from external file' do 

        it 'List of credentials from excel file' do 

        data = Roo::Spreadsheet.open('./spec/data/invalidLoginCredentials.xlsx')
        
         for i in 2..data.last_row do
            email=data.cell('A', i)
            password=data.cell('B', i)
            actions.login(email, password)

            sleep 1

            if(@browser.url!=LOGIN_URL)
               acceptedCredentials="acceptedCredentials#{i}"
               @browser.screenshot.save "./screenshots/#{acceptedCredentials}.png"  
               puts "Login information that passed: email: #{email} and password: #{password}."
               actions.logout
            end

         end

    end

    end

end
