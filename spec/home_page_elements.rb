require 'rspec'
require 'watir'
require 'helper'
require 'elements/objects'
require 'shared_context/login_shared'

describe 'Clickability of elements on the home page, search_bar functionality and My Account options' do
    
    let(:actions) {@main.methods}

    include_context 'Login' , "mark44@gmail.com", "bbb" 

    context 'Clickability of elements in the header section' do 

        it 'Clickability on the Auction icon' do 
            actions.logo_icon
            expect(@browser.url). to eql('https://auction-app-react.herokuapp.com/')
        end

        it 'Facebook (header) icon check' do 
            actions.facebook_header
            sleep 2
            expect(@browser.window(title: 'Facebook').url).to eql("https://www.facebook.com/magicpojska")
        end

        it 'Instagram (header) icon check' do 
            actions.instagram_header
            sleep 2
            expect(@browser.window(title: 'Login • Instagram').url).to eql("https://www.instagram.com/accounts/login/?next=/magic_pojska/")
        end

        it 'Twitter (header) icon check' do 
            actions.twitter_header
            sleep 2
            expect(@browser.window(title: 'Twitter').url).to eql("https://twitter.com/magicpojska")
        end

        it 'HOME button check' do 
            actions.home
            sleep 4
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/')

        end

        it 'SHOP button check' do 
            actions.shop_page
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/shop/categories/search')
        end

        it 'MY ACCOUNT button check' do 
            actions.my_account
            sleep 4
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/profile')
        end

        it 'MY ACCOUNT/Seller button check' do 
            actions.seller_page
            sleep 4
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/seller')
        end

        it 'MY ACCOUNT/Bids button check' do 
            actions.bids_page
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/bids')
        end

        it 'MY ACCOUNT/Wishlist button check' do 
            actions.wishlist
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/wishlist')
        end

        it 'MY ACCOUNT/Settings button check' do 
            actions.settings
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/settings')
        end

        it 'Logout check' do 
            actions.logout
            @browser.screenshot.save 'screenshotLogout.png'
        end
       
    end

    context 'Search bar functionality' do 

        it 'Search for regular item' do 
            actions.search_bar("hoodie")
            sleep 3
            expect(@browser.text.include?("hoodie")).to be true
        end

        it 'Use search_bar with irregular input' do 
            actions.search_bar("XyXjcdc")
            sleep 2
            expect(@browser.text.include?("No products to show")).to be true
            sleep 1
            actions.home_page
        end

        it 'Use search_bar without input' do 
            actions.search_bar("")
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/shop/categories/search/')
        end

    end

    context 'Clickability of elements in the footer section' do 

        it 'About Us check' do 
            actions.about_us
            sleep 1
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/about-us')
            sleep 1
            actions.home_page
        end

        it 'Terms and Conditions check' do 
            actions.terms_and_conditions
            sleep 1
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/terms-and-conditions')
            sleep 1
            actions.home_page
        end

        it 'Privacy and Policy check' do 
            actions.privacy_policy
            sleep 4
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/privacy-and-policy')
            sleep 1
            actions.home_page
        end

        it 'Facebook (footer) icon check' do 
            actions.facebook_footer
            sleep 4
            expect(@browser.window(title: 'Facebook').url).to eql("https://www.facebook.com/magicpojska")
        end

        it 'Instagram (footer) icon check' do 
            actions.instagram_footer
            sleep 2
            expect(@browser.window(title: 'Login • Instagram').url).to eql("https://www.instagram.com/accounts/login/?next=/magic_pojska/")
        end

        it 'Twitter (footer) icon check' do 
            actions.twitter_footer
            sleep 2
            expect(@browser.window(title: 'Twitter').url).to eql("https://twitter.com/magicpojska")
        end

    end

end