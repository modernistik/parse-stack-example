
class Artist < Parse::Object
  property :name, :string

  has_many :managers, as: :user
  has_many :fans, through: :relation, as: :user
end
