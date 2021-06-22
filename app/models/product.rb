class Product < ApplicationRecord
  validates :title, :description, :image_url, :category, presence:true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  has_many :line_items
  has_many :orders, through: :line_items
  enum category: {
    "Action" => "Action",
    "Comedy" => "Comedy",
    "Drama" => "Drama",
    "Kids" => "Kids",
    "Romantic Comedy" => "Romantic Comedy",
    "Horror" => "Horror"
  }
  validates :category, inclusion: categories.keys
  before_destroy :ensure_not_referenced_by_any_line_item

  private
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Item present')
      throw :abort
    end
  end
end
