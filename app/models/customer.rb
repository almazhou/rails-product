class Customer < ActiveRecord::Base
	validates :name, presence: true
	has_many :orders
end
