class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile
  has_many :auctions
  has_many :auction_transactions, dependent: :destroy
  validates :fullname, presence: true
  validates :email, presence: :true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP , :message => "Email format is invalid"}
  enum :role, { user: "USER", admin: "ADMIN" }
end
