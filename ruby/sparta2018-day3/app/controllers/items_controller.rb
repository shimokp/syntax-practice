class ItemsController < ApplicationController
    def show
        @params = params
        Item.all
    end
end
