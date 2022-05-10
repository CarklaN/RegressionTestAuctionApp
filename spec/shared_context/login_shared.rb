require 'rspec'
require 'watir'
require 'helper'
require 'elements/objects'
require 'elements/page_container'

  shared_context 'Login' do |email, password|

  let(:actions) {@main.methods}

  context 'Login with valid credentials' do

    it "Enters valid #{email} and #{password} and login into Auction account" do
      actions.login(email,password)
    end

  end

end