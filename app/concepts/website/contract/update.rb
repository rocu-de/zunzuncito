class Website::Contract::Update < Reform::Form
  property :title
  property :base_url
  property :theme

  validates :title, presence: true
  validates :base_url, presence: true
  validates :theme, presence: true
end
