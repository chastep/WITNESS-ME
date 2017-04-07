class User < ApplicationRecord
  has_secure_password

  has_many :challenges
  def full_name
    @full_name
  end

  def split_name(full_name)
    self.first_name = full_name.split(" ")[0]
    self.last_name = full_name.split(" ")[1]
  end
end
