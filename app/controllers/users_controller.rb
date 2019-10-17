class UsersController < ApplicationController
  def index
  	@user=User.all
  end
  def show 
  	@user=User.find_by(id: params[:id])
  end
  def new
  	@user=User.new
  end
  def create
  	@user=User.new(
  		name: params[:name],
  		email: params[:email],
  		image_name: "jellyfish-698521_960_720.jpg"
  		)
  	 if params[:image]	
  	@user.image_name ="#{@user.id}.jpg"
  	image = params[:image]
  	File.binwrite("publinc/user_images/#{@user.image_name}",image.read)
  end
  	if @user.save
  		redirect_to("/users/#{@user.id}")
 	else 		
 		render("users/new")
 	end	
  end
  def edit
  	@user=User.find_by(id: params[:id])
  end
  def update
  	@user=User.find_by(id: params[:id])
  	@user.name= params[:name]
  	@user.email= params[:email]
  if params[:image]	
  	@user.image_name ="#{@user.id}.jpg"
  	image = params[:image]
  	File.binwrite("publinc/user_images/#{@user.image_name}",image.read)
  end
  if @user.save
  	flash[:notice]="edited"
  	redirect_to("/users/#{@user.id}")
  else
  	render("users/edit")
  end
  end
end
