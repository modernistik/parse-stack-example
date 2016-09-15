
class Song < Parse::Object
  property :name, :string

  property :released, :integer
  property :genres, :array

  has_many :likes, through: :relation, as: :user
  belongs_to :artist
end
