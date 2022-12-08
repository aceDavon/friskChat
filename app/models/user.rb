class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name,
            length: { minimum: 3, message: 'fields can not be less than 3 letters' }
  validates :bio,
            length: { minimum: 12, maximum: 500, message: 'fields can not be less than 12 and can not be more than 500 letters' }
  validates_format_of :photo, with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: 'field is not a valid url'
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  ROLES = %i[admin default].freeze

  def recent_posts
    posts.includes([:author]).last(3)
  end

  def is?(query_role)
    role == query_role.to_s
  end
end
