class Widget
  include ActiveModel::AttributeMethods

  attr_accessor :donuts_url, :cronuts_url

  URL_REGEX = %r{^(http|https)://[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?/.*)?$}ix.freeze

  CRONUTS_URL = 'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_'\
  'Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg'.freeze
  DONUTS_URL = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut'\
  '.jpg'.freeze

  def initialize(donuts_url = DONUTS_URL, cronuts_url = CRONUTS_URL)
    @cronuts_url = get_cronuts_url cronuts_url
    @donuts_url  = get_donuts_url donuts_url
  end

  def persisted?
    false
  end

  private

  def get_donuts_url(url)
    valid_url?(url) ? url : DONUTS_URL
  end

  def get_cronuts_url(url)
    valid_url?(url) ? url : CRONUTS_URL
  end

  def valid_url?(url)
    url =~ URL_REGEX
  end
end
