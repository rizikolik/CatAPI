class ToysController < ApplicationController
    def index
    @cat=Cat.find(params[:cat_id])
    @toys=@cat.toys
    end
    def new
        @cat=Cat.find(params[:cat_id])
     @toy=Toy.new
       
    end

    def show
     @toy=Toy.find(params[:id])
    end
    def edit
    end
    def create
     @cat=Cat.find(params[:cat_id])
        @toy=@cat.toys.create(toy_params)
        if @toy.save
            flash[:success] = 'Toy successfuly created!'
       redirect_to @cat
      else
        @toy.errors.full_messages.each do|err|
            flash[:danger] =err
           end
        render 'new'
       end
  
      end
  
  
    def toy_params
        params.require(:toy).permit(:name, :ttype,:cat_id)
    end
end
