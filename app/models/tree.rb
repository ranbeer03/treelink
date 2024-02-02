class Tree < ApplicationRecord

    validates :name, presence: true, uniqueness: true, length: { minimum: 5, message: 'must be at least 5 characters long' }
    validates :instagram, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}\z/, message: 'must be a valid URL' }, allow_blank: true
    validates :youtube, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}\z/, message: 'must be a valid URL' }, allow_blank: true
    validates :x, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}\z/, message: 'must be a valid URL' }, allow_blank: true

    extend FriendlyId
    friendly_id :name, use: :slugged

    belongs_to :user
    has_many :comments
    belongs_to :category, optional: true
end
