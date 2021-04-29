class Api::V1::CharactersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  
  before_action :set_character, only: [:show, :update, :destroy]
  
  def index
    @characters = policy_scope(Character)
  end
  
  def show
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user
    authorize @character
    if @character.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
     if @character.update(character_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @character.destroy
    head :no_content
  end

  private

  def character_params
    params.require(:character).permit(:name, :age, :weight, :history, :photo)
  end

  def set_character
    @character = Character.find(params[:id])
    authorize @character
  end

   def render_error
    render json: { errors: @character.errors.full_messages },
      status: :unprocessable_entity
  end
end