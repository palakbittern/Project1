class BooksController < ApplicationController

  def index
    #@books = Book.all
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 10)
 end
   
  def show
  	@book = Book.find(params[:id])
       UserMailer.welcome_email(@user).deliver_now
  end


  def new
   @book = Book.new
  end

  def edit
   @book = Book.find(params[:id])
  end

  	def create
    #@category = Category.find(params[:category_id])
    #@book = @book.categories.create(book_params)
    #redirect_to books_path(@book)
     @book = Book.new(book_params)
 
     if @book.save
       redirect_to  books_path
     else
      render 'new'
      end
    end

   def update 
   	@book = Book.find(params[:id])
 
  if @book.update(book_params)
    redirect_to books_path
  else
    render 'edit'
   end
end

 def destroy
	  @book = Book.find(params[:id])
	  @book.destroy
	 redirect_to books_path
	 end

    private
    def book_params
      params.require(:book).permit(:category_id, :name, :author, :price, :image)
    end
end
