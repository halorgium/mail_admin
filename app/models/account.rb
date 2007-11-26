require 'digest/sha1'

class Account < ActiveRecord::Base
  belongs_to :domain
  has_many :aliases, :class_name => 'Forwarding', :foreign_key => 'destination_account_id'
  
  validates_presence_of :domain_id, :name
  validates_uniqueness_of :name, :scope => :domain_id

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?

  before_save :encrypt_password
  
  def self.find_by_email(email)
    name, domain = Domain.split_email(email)
    if domain
      domain.accounts.find_by_name(name)
    else
      nil
    end
  end
  
  def email
    [name, domain_name].join("@")
  end
  
  def domain_name
    domain.name
  end

  def uid
    optional_uid || domain.uid
  end

  def uid=(uid)
    self.optional_uid = uid
  end

  def gid
    optional_gid || domain.gid
  end

  def gid=(gid)
    self.optional_gid = gid
  end

  # Authenticates a user by their name and unencrypted password.  Returns the user or nil.
  def self.authenticate(name, password)
    u = find_by_name(name) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    password.crypt(salt)
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{name}--")[0..1] if new_record?
      self.crypted_password = encrypt(password)
    end

    def password_required?
      crypted_password.blank? || !password.blank?
    end
end
