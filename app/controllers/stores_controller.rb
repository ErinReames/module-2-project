class StoresController < ApplicationController
    # Action/Route Filters
    before_action(:assign_store, only: [:show])

    # Action/Route Methods
    def index
        @stores = Store.all_name_ordered
    end

    def show
    end

    # Private Class Instance Helper Methods
    private
    def assign_store
        @store = Store.find(params[:id])
    end

end