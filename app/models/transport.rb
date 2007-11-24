class Transport < ActiveRecord::Base
  belongs_to :domain
  
  validates_presence_of :domain_id
  validates_uniqueness_of :domain_id
end
