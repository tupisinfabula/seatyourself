class Restaurant < ActiveRecord::Base
  validates :name, :address, :city, :capacity, :open_hour, :close_hour, presence: true

  has_many :users, through: :reservations
  has_many :reservations
  belongs_to :user
  has_many :searches

  # def self.search(search)
  #   if search
  #     where(["name LIKE ?", "%#{search}%"])
  #   else
  #     all
  #   end
  # end

  # def search_restaurants
  #   restaurants = Restaurant.all
  #
  #   restaurants = restaurants.where(["capacity >= ?", people]) if people.present?
  #   restaurants = restaurants.where(["category LIKE ?", category]) if category.present?
  #   restaurants = restaurants.where(["price >= ?", min_price]) if min_price.present?
  #   restaurants = restaurants.where(["price <= ?", max_price]) if max_price.present?
  #   restaurants = restaurants.where(["city LIKE ?", location]) if location.present?
  #
  #   return restaurants
  #
  # end


end
