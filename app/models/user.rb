class User < ApplicationRecord
  include BCrypt

  has_secure_password

  has_many :challenges

  def full_name
    @full_name
  end

  def show_full_name
    self.first_name + " " + self.last_name
  end

  def split_name(full_name)
    self.first_name = full_name.split(" ")[0]
    self.last_name = full_name.split(" ")[1]
  end

  # def routing_number
  #   @routing_number
  # end

  # def account_number
  #   @account_number
  # end

  # def type
  #   @type
  # end

  # def last_four_digits(number)
  #   number[-4..-1]
  # end

  def customer_request_body
    {
      :firstName => self.first_name,
      :lastName => self.last_name,
      :email => self.email
    }
  end

  def funding_request_body(routing_number, account_number, type)
    {
      :routingNumber => routing_number,
      :accountNumber => account_number,
      :type => type,
      :name => self.first_name + " " + self.last_name + " - "
    }
  end

end
