Product.delete_all

products = [
  {
    title: 'Rails for Beginners',
    description: %(<p>
      <em>Start your journey with Rails</em>
      Learn the basics of Ruby on Rails and build your first web application from scratch. This book covers everything you need to know to get started quickly and efficiently.
    </p>),
    price: 24.99,
    image: 'rails.png'
  },
  {
    title: 'Mastering Ruby',
    description: %(<p>
      <em>Deep Dive into Ruby Programming</em>
      Unlock the full potential of Ruby with advanced techniques, best practices, and real-world examples. Perfect for developers looking to level up their Ruby skills.
    </p>),
    price: 27.50,
    image: 'ruby5.jpg'
  },
  {
    title: 'Network Client Essentials',
    description: %(<p>
      <em>Building Robust Network Clients</em>
      A comprehensive guide to creating reliable and efficient network clients in Ruby. Learn about protocols, error handling, and performance optimization.
    </p>),
    price: 19.95,
    image: 'nrclient2.jpg'
  },
  {
    title: 'Loren Ipsum Guide',
    description: %(<p>
      <em>Design and Typography with Loren Ipsum</em>
      Explore the history and usage of Loren Ipsum in design and publishing. Includes tips for effective placeholder text and layout strategies.
    </p>),
    price: 15.00,
    image: 'lorem.jpg'
  },
  {
    title: 'Rails Scales!',
    description: %(<p>
      <em>Practical Techniques for Performance and Growth</em>
      Rails doesn’t scale. So say the naysayers. They’re wrong. Ruby on Rails
      runs some of the biggest sites in the world, impacting the lives of
      millions of users while efficiently crunching petabytes of data. This
      book reveals how they do it, and how you can apply the same techniques to
      your applications. Optimize everything necessary to make an application
      function at scale: monitoring, product design, Ruby code, software
      architecture, database access, caching, and more. Even if your app may
      never have millions of users, you reduce the costs of hosting and
      maintaining it.
    </p>),
    price: 30.95,
    image: 'cprpo.jpg'
  }
]

products.each do |attrs|
  product = Product.create!(
    title: attrs[:title],
    description: attrs[:description],
    price: attrs[:price]
  )
  product.image.attach(
    io: File.open(Rails.root.join('db', 'images', attrs[:image])),
    filename: attrs[:image]
  )
end
