class User < ApplicationRecord
  has_one :user_profile
  has_many :documents
  has_many :sender_ids, :class_name => 'SharedFile', :foreign_key => 'sender_id'
  has_many :receiver_ids, :class_name => 'SharedFile', :foreign_key => 'receiver_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
