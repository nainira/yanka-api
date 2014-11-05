class CommentsController < ApplicationController
  def index
    car = Car.find(params[:car_id])
    comments = car.comments
    render json: comments, status: 200
  end
  # def show
  #   car = Car.find(params[:id])
  #   comment = car.comments.all
  #   render json: comment
  # end

  def create
    car = Car.find(params[:car_id])
    comment = car.comments.build(comment_params)
    if comment.save
      render json: comment, status: 201
    else
      render json: comment.errors, status: 422
    end
    # response_to do |format|
    #   format.json { render json: comment, status: 200 }
    #   format.html comment
    # end
  end

  def destroy

  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end