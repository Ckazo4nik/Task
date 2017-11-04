class CommentsController < ApplicationController
    respond_to :js


    def create
        @advert = Advert.find(params[:advert_id])
        respond_with (@comment = @advert.comments.create(set_params.merge(user_id: current_user.id)))
    end

    private

      def set_params
    params.require(:comment).permit(:body, :advert_id,:user_id)
  end
end
