class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time

  has_one_attached :image
end
