class Domain < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  has_many :transports, :dependent => :destroy
  has_many :forwardings
  
  validates_presence_of :name, :uid, :gid
  validates_uniqueness_of :name

  def self.find_by_email(email)
    split_email(email).last
  end

  def self.split_email(email)
    name, domain = email.split(/@/, 2)
    [name, Domain.find_by_name(domain)]
  end
end
