class FlashCardsController < ApplicationController

  def index
    @flash_cards = FlashCard.all
  end

  def show
    @flash_card = FlashCard.find(params[:id])
  end

  def next
    current_id = params[:id]
    next_id = FlashCard.where("id > ?", current_id.to_i).first
    if next_id === nil
      next_id = FlashCard.first
      redirect_to controller: :flash_cards, action: :show, id: next_id
      return
    end
    redirect_to controller: :flash_cards, action: :show, id: next_id
  end

  def previous
    current_id = params[:id]
    previous_id = FlashCard.where("id < ?", current_id.to_i).last
    if previous_id === nil
      previous_id = FlashCard.last
      redirect_to controller: :flash_cards, action: :show, id: previous_id
      return
    end
    redirect_to controller: :flash_cards, action: :show, id: previous_id
  end

  def answer
    @flash_card = FlashCard.find(params[:id])
  end

  def new
    @flash_card = FlashCard.new
  end

  def create
    @flash_card = FlashCard.new(flash_card_params)
    if @flash_card.save
      redirect_to @flash_card
    else
      render 'new'
    end
  end

  def update
    @flash_card = FlashCard.find(params[:id])
    if @flash_card.update(flash_card_params)
      redirect_to @flash_card
    else
      render 'edit'
    end
  end

  def edit
    @flash_card = FlashCard.find(params[:id])
  end

  def destroy
    @flash_card = FlashCard.find(params[:id])
    @flash_card.destroy

    redirect_to flash_cards_path
  end

end

private
  def flash_card_params
    params.require(:flash_card).permit(:prompt, :answer)
  end
