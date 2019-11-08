class PostsController < ApplicationController
   before_action :authenticate_user
      before_action :current_user_id,{only:[:edit,:destroy]}
  def index
  	@posts = Post.all.order(created_at: :desc)
  end
  def show
  	 @post=Post.find_by(id:params[:id])
     @user=@post.user
  	
  end
  def new
  	@post=Post.new
  end
  def create
  	@post = Post.new(content: params[:content],
      user_id: @current_user.id)
  	if @post.save
  		flash[:notice] = "Successfully created..."

  	redirect_to("/posts/index")
  else
  	render("posts/new")
  end
  end
  def edit
  	@post=Post.find_by(id: params[:id])
  end
  def update
  	@post = Post.find_by(id: params[:id])
  	@post.content = params[:content]
  	if @post.save
  		flash[:notice] = "Successfully created..."
  	redirect_to("/posts/index")
  	else
  	render("posts/edit")
  	end

  end
  def destroy
  	@post = Post.find_by(id: params[:id])
  	@post.destroy
  		flash[:notice] ="deleted"
  	redirect_to("/posts/index")
end
def current_user_id
  @post = Post.find_by(id: params[:id])
  if @post.user_id != @current_user.id
    flash[:notice]="no right"
    redirect_to("/posts/index")
  end

 end
  

end
