class BlogPost::Contract::Update < Reform::Form
  property :title
  property :content
  property :path
  property :draft

  validates :title, presence: true
  validates :content, presence: true
  validates :path, presence: true
end
