class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  def friendly_updated_at
    return updated_at.strftime("%m-%e-%y %H:%M")
  end

  def full_name
    return first_name + " " + middle_name + " " + last_name
  end

  def japanese_phone
    return "+81-" + phone_number
  end
end
