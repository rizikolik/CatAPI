class CatsController < ApplicationController
    def index
      @cats=Cat.all 
     
    end
    def new
    @cat=Cat.new  
    end
    def edit
      @cat=Cat.find(params[:id])
    end
   
    def show
        @cat=Cat.find(params[:id])
   
     
    end
    def create
      @cat=Cat.create(cat_params)
      if @cat.save
        flash[:success] = 'Cat successfuly created!'
     redirect_to @cat
    else
     @cat.errors.full_messages.each do|err|
      flash[:danger] =err
     end
      render 'new'
     end

    end
    def update
    end
    
    def destroy
      @cat = Cat.find(params[:id])
      @cat.destroy
      flash[:success] = 'Cat successfuly deleted!'
   
      redirect_to  cats_path
    end
    def cat_params
      params.require(:cat).permit(:name, :color,:cat_id)
    end
   
end
