class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :title
    validates :item_description
    validates :category_id
    validates :item_state_id
    validates :shipping_cost_id
    validates :shipping_area_id
    validates :shipping_time_id
    validates :cost,
              format: { 
                with: /\A[\d]+\z/, message: 'Half-width number' 
              },
              numericality: {
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9999999,
                message: "Out of setting range"
              }
  end
end
