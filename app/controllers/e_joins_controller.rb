class EJoinsController < ApplicationController
  before_action :set_e_join, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /e_joins or /e_joins.json
  def index
    @e_joins = EJoin.all
  end

  # GET /e_joins/1 or /e_joins/1.json
  def show
  end

  # GET /e_joins/new
  def new
    @event = Event.find(params[:event_id])
    if @event.users.exists?(current_user.id)
      flash[:alert] = "Bạn đã tham gia sự kiện này!"
      redirect_to root_path
    else
      @e_join = EJoin.new
      @e_join.user_id = current_user.id
      @e_join.event_id = @event.id
    end
  end

  # GET /e_joins/1/edit
  def edit
  end

  # POST /e_joins or /e_joins.json
  def create
    @e_join = EJoin.new(e_join_params)

    respond_to do |format|
      if @e_join.save
        format.html { redirect_to root_path, notice: "E join was successfully created." }
        format.json { render :show, status: :created, location: @e_join }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @e_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /e_joins/1 or /e_joins/1.json
  def update
    respond_to do |format|
      if @e_join.update(e_join_params)
        format.html { redirect_to e_join_url(@e_join), notice: "E join was successfully updated." }
        format.json { render :show, status: :ok, location: @e_join }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @e_join.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /e_joins/1 or /e_joins/1.json
  def destroy
    @e_join.destroy

    respond_to do |format|
      format.html { redirect_to e_joins_url, notice: "E join was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_e_join
      @e_join = EJoin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def e_join_params
      params.require(:e_join).permit(:user_id, :event_id)
    end
end
