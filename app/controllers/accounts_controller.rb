class AccountsController < ApplicationController
  make_resourceful do
    belongs_to :domain
    actions :all
  end
end
