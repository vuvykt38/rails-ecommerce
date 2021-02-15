require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(title: 'My book table',
                          description: 'abcxyz',
                          image_url: 'abc.gif')
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: 'My book table',
                description: 'abcxyz',
                price: 1,
                image_url: image_url)
  end

  test "image url" do
    ok = %w(abc.gif abc.png abc.jpg ABC.JPG ABC.gIf http://a.b.c/x/y/z/fred.gif)
    bad = %w(abc.doc abc.gif/more abc.gif.more)

    ok.each do |image_url|
      assert new_product(image_url).valid?
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?
    end
  end

end
