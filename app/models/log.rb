class Log
  include Mongoid::Document
  include Mongoid::Timestamps

  field :object_type, type: String
  field :object_id, type: String
  field :author_id, type: Integer
  field :action, type: String
  field :created_at, type: DateTime
  field :serialized_object, type: Hash
  field :extras, type: Hash

  validates :object_type, :object_id, :author_id, :action, :serialized_object, presence: true
end
