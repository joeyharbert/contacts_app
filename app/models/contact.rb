class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%m-%e-%y %H:%M")
  end
end
