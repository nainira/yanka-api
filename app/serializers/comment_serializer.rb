class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :car_id
  belongs_to :car


end
