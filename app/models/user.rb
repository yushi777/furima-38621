class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :order

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid'
  validates :nick_name, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :read_first_name, presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/ }
  validates :read_last_name, presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/ }
  validates :birth_day, presence: true
end
