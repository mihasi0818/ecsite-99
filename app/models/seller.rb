class Seller < ApplicationRecord
  before_create :set_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
          validates :name
        end
        private

  # ランダムなユーザーIDを返す
  def set_id
    while self.id.blank? || Seller.find_by(id: self.id).present? do
      self.id = SecureRandom.urlsafe_base64(10)
    end
  end

end
