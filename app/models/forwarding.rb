class Forwarding < ActiveRecord::Base
  belongs_to :destination_account, :class_name => 'Account'
  belongs_to :source_domain, :class_name => 'Domain'
  
  validates_presence_of :source_domain_id, :destination_account_id
  validates_uniqueness_of :source_name, :scope => :source_domain_id

  def source=(source)
    self.source_name, self.source_domain = Domain.split_email(source)
  end
  
  def source
    [source_name, source_domain_name].join("@")
  end

  def destination=(destination)
    self.destination_account = Account.find_by_email(destination)
  end

  def destination
    destination_account.email
  end
  
  def source_domain_name
    source_domain.name
  end
end
