class CarSerializer < ActiveModel::Serializer
  # cached
  # delegate :cache_key, to: :object

  # root false

  attributes :id, :number, :created_at, :comments_ids

  # has_many :comments

  def comments_ids
    result = []
    object.comments.map do |comment|
      result.push(comment.id)
    end
    result
  end

  # def created_at
  #   object.created_at.strftime("%m/%d/%Y|%X")
  # end
end
