class DrinksController < ApplicationController

    def index
        if params[:name]
            @drinks = Drink.drink_search(params[:name])
        else
          @drinks = Drink.all
        end
    end

    def new
        @drink = Drink.new
        @items = Item.all
    end

    def show
        @drink = Drink.find_by(id: params[:id])
    end

    def create
        @drink = Drink.new(drink_params)
        if @drink.save
            redirect_to drink_path(@drink)
        else
            render :new
        end
    end

    def destroy
        @drink = Drink.find_by(id: params[:id])
        @drink.delete
        redirect_to drinks_path
    end

    private
    def drink_params
        params.require(:drink).permit(:drink_name, :drink_thumb, :item_id)
    end

end
