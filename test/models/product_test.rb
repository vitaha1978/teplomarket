require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def new_product(image_url)
    Product.new(title: "My title",
                description: "My description",
                price: 1,
                image_url: image_url)
  end

  test "Image_url" do
    # URL зображення
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
              http://a.s.c/x/y/x/frd.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} не повинно бути невірним"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} не повинно бути вірним"
    end
  end

  test "Products atributes must not be empty" do
    # Властивості товару не повинні бути пустими
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "Rroduct price must be positive" do
    product = Product.new(title:       "My Book Title",
                          description: "yyy",
                          image_url:   "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "Product is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title, 
                          description: "My description",
                          price: 1,
                          image_url: "fred.png")
    assert product.invalid?

    assert_equal [I18n.translate('errors.messages.taken')], 
                  product.errors[:title]

  end

end
