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
      UserMailer.welcome_email(current_user).deliver_now
    
    redirect_to categories_path
  else
    render 'new'
  end
end

def update
  @category = Category.find(params[:id])
 
  if @category.update(category_params)
    redirect_to @category
  else
    render 'edit'
  end
end
 
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
 
    redirect_to @category
  end

private
  def category_params
    params.require(:category).permit(:name, :description)
  end

end
