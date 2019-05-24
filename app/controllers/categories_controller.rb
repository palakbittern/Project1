class CategoriesController < ApplicationController
  def index
  	 @categories = Category.all
    # @categories = Category.search(params[:search])
  end

  def show
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def edit
  	 @category = Category.find(params[:id])
  end

 def create
  @category = Category.new(category_params)
 
  if @category.save
     flash[:success] = " Category has been Sucessfully Created "
      UserMailer.welcome_email(current_user).deliver_now
    
    redirect_to categories_path
  else
       flash.now[:error] = "Book is not updated #{@category.name}."
    render 'new'
  end
end

def update
  @category = Category.find(params[:id])
 
  if @category.update(category_params)
     flash[:success] = " Category has been Sucessfully Created "
    redirect_to @category
  else
     flash[:success] = " Category has not been Sucessfully Updated "
    render 'edit'
  end
end
 
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
      flash[:success] = " Category has been Sucessfully Deleted "
    redirect_to @category
  end

private
  def category_params
    params.require(:category).permit(:name, :description)
  end

end
