class DomainsController < ApplicationController
  make_resourceful do
    actions :all
    publish :json, :xml, :attributes => [:name, :uid, :gid]
  end
end
