class CommentsController < ApplicationController
	
    skip_before_filter :verify_authenticity_token

    def create
    	@tema = Tema.find(params[:tema_id])
    	@comment = @tema.comments.create(comment_params)
    	@comment.usuario_id = current_user.id
    	@comment.save
    	redirect_to @tema
  	end

    def editc
        comment = Comment.find(params[:id])
        comment.body = params[:body]
        comment.save
        redirect_to "/temas/"+comment.tema_id.to_s
    end

	private 
	def comment_params
		params.require(:comment).permit(:body)
	end
end