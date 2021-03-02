class Api::V1::CardsController < ApplicationController

    def index
        cards = Card.all
        # render json: cards
        render json: CardSerializer.new(cards)
    end

    def create
        card = Card.new(card_params)

        if card.save
            # render json: card, status: :accepted
            render json: CardSerializer.new(card), status: :accepted
        else
            render json: {errors: card.errors.full_messages}, status: :unprocessible_entity
        end

    end

    private
    
    def card_params
    params.require(:card).permit(:name, :card_type, :meaning_up, :meaning_rev, :description, :image)
    end

end
