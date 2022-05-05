require 'rspec'
require 'watir'
require 'elements/Objects'

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

    context 'Clickability of elements in the header section' do 

        it 'Clickability on the Auction icon' do 
            Objects.logoIcon(@browser)
            expect(@browser.url). to eql('https://auction-app-react.herokuapp.com/')
        end

        it 'Facebook (header) icon check' do 
            Objects.facebookHeader(@browser)
            sleep 4
            expect(@browser.window(title: 'Facebook').url).to eql("https://www.facebook.com/magicpojska")
        end

        it 'Instagram (header) icon check' do 
            Objects.instagramHeader(@browser)
            sleep 2
            expect(@browser.window(title: 'Login • Instagram').url).to eql("https://www.instagram.com/accounts/login/?next=/magic_pojska/")
        end

        it 'Twitter (header) icon check' do 
            Objects.twitterHeader(@browser)
            sleep 2
            expect(@browser.window(title: 'Twitter').url).to eql("https://twitter.com/magicpojska")
        end

        it 'Login check' do 
            Objects.login(@browser,"mark44@gmail.com", "bbb")
            sleep 2
            @browser.screenshot.save 'screenshotLogin.png'
        end

        it 'HOME button check' do 
            Objects.home(@browser)
            sleep 4
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/')

        end

        it 'SHOP button check' do 
            Objects.shopPage(@browser)
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/shop/categories/search')
        end

        it 'MY ACCOUNT button check' do 
            Objects.myAccount(@browser)
            sleep 4
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/profile')
        end

        it 'MY ACCOUNT/Seller button check' do 
            Objects.sellerPage(@browser)
            sleep 4
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/seller')
        end

        it 'MY ACCOUNT/Bids button check' do 
            Objects.bidsPage(@browser)
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/bids')
        end

        it 'MY ACCOUNT/Wishlist button check' do 
            Objects.wishlist(@browser)
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/wishlist')
        end

        it 'MY ACCOUNT/Settings button check' do 
            Objects.settings(@browser)
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/my-account/settings')
        end

        it 'Logout check' do 
            Objects.logout(@browser)
            @browser.screenshot.save 'screenshotLogout.png'
        end
       
    end

    context 'Search bar functionality' do 

        it 'Search for regular item' do 
            Objects.searchBar(@browser, "hoodie")
            sleep 3
            expect(@browser.text.include?("hoodie")).to be true
        end

        it 'Use searchbar with irregular input' do 
            Objects.searchBar(@browser, "XyXjcdc")
            sleep 2
            expect(@browser.text.include?("No products to show")).to be true
            sleep 1
            Objects.homePage(@browser)
        end

        it 'Use searchbar without input' do 
            Objects.searchBar(@browser, "")
            sleep 2
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/shop/categories/search/')
        end

    end

    context 'Clickability of elements in the footer section' do 

        it 'About Us check' do 
            Objects.aboutUs(@browser)
            sleep 1
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/about-us')
            sleep 1
            Objects.homePage(@browser)
        end

        it 'Terms and Conditions check' do 
            Objects.termsAndConditions(@browser)
            sleep 1
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/terms-and-conditions')
            sleep 1
            Objects.homePage(@browser)
        end

        it 'Privacy and Policy check' do 
            Objects.privacyPolicy(@browser)
            sleep 4
            expect(@browser.url).to eql('https://auction-app-react.herokuapp.com/privacy-and-policy')
            sleep 1
            Objects.homePage(@browser)
        end

        it 'Facebook (footer) icon check' do 
            Objects.facebookFooter(@browser)
            sleep 4
            expect(@browser.window(title: 'Facebook').url).to eql("https://www.facebook.com/magicpojska")
        end

        it 'Instagram (footer) icon check' do 
            Objects.instagramFooter(@browser)
            sleep 2
            expect(@browser.window(title: 'Login • Instagram').url).to eql("https://www.instagram.com/accounts/login/?next=/magic_pojska/")
        end

        it 'Twitter (footer) icon check' do 
            Objects.twitterFooter(@browser)
            sleep 2
            expect(@browser.window(title: 'Twitter').url).to eql("https://twitter.com/magicpojska")
        end

    end

end