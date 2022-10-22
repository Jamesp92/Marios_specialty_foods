class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save(:titleize_product)
  before_save(:titleize_country_of_origin)
  validates :name, presence: true
  validates :country_of_origin, presence: true
  validates :cost, presence: true
  validates_length_of :name, maximum: 100
  

  private
    def titleize_product
      self.name = self.name.titleize
    end
  
    def titleize_country_of_origin
      self.country_of_origin = self.country_of_origin.titleize
    end
end