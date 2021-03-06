class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_time

  has_one_attached :image
  belongs_to :user
  has_one    :order

  with_options presence: true do
    validates :image
    validates :title
    validates :item_description
    validates :category_id
    validates :item_state_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_time_id
    validates :cost,
              numericality: { only_integer: true, message: 'Half-width number' }
  end

  validates :cost,
            numericality: {
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999,
              message: 'Out of setting range'
            }
end
