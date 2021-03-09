class Api::V1::RandomsController < ApplicationController

    def index
        random_cards = Card.random_all
        render json: random_cards
    end
end