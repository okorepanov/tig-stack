class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :title, type: String
  field :body, type: String

  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
end
