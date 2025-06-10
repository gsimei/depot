require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image].any?
  end

  test "product price must not be negative" do
    product = Product.new(
      title: "Test Product",
      description: "Test Description",
      price: -1
    )
    product.image.attach(
      io: File.open("test/fixtures/files/lorem.jpg"),
      filename: "lorem.jpg",
      content_type: "image/jpeg"
    )

    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join
  end

  test "product price must not be zero" do
    product = Product.new(
      title: "Test Product",
      description: "Test Description",
      price: 0
    )
    product.image.attach(
      io: File.open("test/fixtures/files/lorem.jpg"),
      filename: "lorem.jpg",
      content_type: "image/jpeg"
    )

    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join
  end

  test "product price of 0.01 is valid" do
    product = Product.new(
      title: "Test Product",
      description: "Test Description",
      price: 0.01
    )
    product.image.attach(
      io: File.open("test/fixtures/files/lorem.jpg"),
      filename: "lorem.jpg",
      content_type: "image/jpeg"
    )

    assert product.valid?
  end

  def new_product(image_url)
    product = Product.new(title: "My Book Title",
    description: "yyy",
    price: 1)
    product.image.attach(io: File.open(image_url),
    filename: "lorem.jpg", content_type: "image/jpeg")
    product
  end


  test "image url" do
    product = new_product("test/fixtures/files/lorem.jpg")
    assert product.valid?, "image/jpeg must be valid"

    product = new_product("test/fixtures/files/logo.svg")
    assert_not product.valid?, "image/svg+xml must be invalid"
  end
end
