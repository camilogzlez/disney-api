class Api::V1::PiecesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_piece, only: [ :show, :update, :destroy ]

  def index
    @pieces = policy_scope(Piece)
  end

  def show
  end

  def create
    @piece = Piece.new(piece_params)
    @piece.user = current_user
    authorize @piece
    if @piece.save
      render :show, status: :created
    else
      render_error
    end
  end

   def update
    if @piece.update(piece_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @piece.destroy
    head :no_content
  end

private

  def set_piece
    @piece = Piece.find(params[:id])
    authorize @piece  # For Pundit
  end

  def piece_params
    params.require(:piece).permit(:category, :title, :creation_date, :rating, :genre_id)
  end

  def render_error
    render json: { errors: @piece.errors.full_messages },
      status: :unprocessable_entity
  end

end