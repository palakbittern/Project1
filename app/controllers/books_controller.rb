class BooksController < ApplicationController

  def index
    #@books = Book.all
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 10)
 end
   
  def show
  	@book = Book.find(params[:id])
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
        flash[:success] = " Book has been Sucessfully Created "
       redirect_to  books_path
     else
       flash.now[:error] = "Book is not updated #{@book.name}."
      render 'new'
      end
    end

   def update 
   	@book = Book.find(params[:id])
     flash[:success] = "Book has been Successfully updated"
 
  if @book.update(book_params)
    redirect_to books_path
  else
       flash.now[:error] = "Book is not updated #{@book.name}."
    render 'edit'
   end
end

 def destroy
	  @book = Book.find(params[:id])
	  @book.destroy

     flash[:success] = "Book has been Successfully deleted"
 
	 redirect_to books_path
	 end

    private
    def book_params
      params.require(:book).permit(:category_id, :name, :author, :price, :image)
    end
end
