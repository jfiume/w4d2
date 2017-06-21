class CatsController < ApplicationController
    def index
      @cat = Cat.all
      render :index
    end

    def show
      @cat = selected_cat

      if @cat
        render :show
      else
        render json:["could not find cat"]
      end
    end

    def edit
      @cat = selected_cat

      render :edit
    end

    def update
      @cat = selected_cat

      if @cat
        @cat.update_attributes(cat_params)
        redirect_to cats_url
        return
      else
        render json:["Can not find cat!"]
      end
    end

    def new
      @cat = Cat.new
      render :new
    end

    def create
      @cat = Cat.new(cat_params)

      if @cat.save
        redirect_to cats_url
      else
        render json:["cannot create cat"]
      end
    end

    private
    def selected_cat
      Cat.find_by(id: params[:id])
    end

    def cat_params
      params.require(:cat).permit(:birth_date, :color, :name, :sex, :description, :img_url)
    end
end
