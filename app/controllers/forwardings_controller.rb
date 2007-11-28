class ForwardingsController < ApplicationController
  make_resourceful do
    belongs_to :domain
    actions :all
  
    before :new, :edit do
      @destination_accounts = Account.find(:all)
    end
  end
end
