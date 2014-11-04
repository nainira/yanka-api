class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :car_id
end
