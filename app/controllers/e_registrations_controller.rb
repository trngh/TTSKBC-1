class ERegistrationsController < ApplicationController
  before_action :set_e_registration, only: %i[ show edit update destroy reject]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /e_registrations or /e_registrations.json
  def index
    case params[:status].to_i
    when 0
      @e_registrations = ERegistration.where(status: 0)
    when 1
      @e_registrations = ERegistration.where(status: 1)
    when 2
      @e_registrations = ERegistration.where(status: 2)
    else
      @e_registrations = ERegistration.all
    end
  end

  # GET /e_registrations/1 or /e_registrations/1.json
  def show
  end

  # GET /e_registrations/new
  def new
    @e_registration = ERegistration.new
    @subjects = Subject.all
  end

  # GET /e_registrations/1/edit
  def edit
  end

  # POST /e_registrations or /e_registrations.json
  def create
    @e_registration = ERegistration.new(e_registration_params)
    @e_registration.user = current_user
    if @e_registration.save
      redirect_to root_path, notice: 'Event registration was successfully created.'
    else
      @subjects = Subject.all  # Make sure to assign @subjects here too in case of render :new
      render :new
    end
  end

  # PATCH/PUT /e_registrations/1 or /e_registrations/1.json
  def update
    respond_to do |format|
      if @e_registration.update(e_registration_params)
        # Tạo event từ thông tin của e_registration sau khi cập nhật thành công
        @event = Event.new(
          title: @e_registration.title,
          detail: @e_registration.detail,
          timestart: @e_registration.timestart,
          timeend: @e_registration.timeend,
          slot: @e_registration.slot,
          room_id: @e_registration.room_id,
          subject_id: @e_registration.subject_id,
          user_id: @e_registration.user_id,
          image: @e_registration.image,
          rate: 0,
          status: 0 # sap dien ra
        )

        if @event.save
          @e_registration.update(status: 1) # Cập nhật trạng thái của e_registration thành 1

          format.html { redirect_to @event, notice: 'Event was successfully created from registration and registration status updated.' }
        else
          format.html { redirect_to @e_registration, notice: 'E registration was successfully updated, but event creation failed.' }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @e_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  def reject
    @e_registration.update(status: 2)

    respond_to do |format|
      format.html { redirect_to e_registrations_url, notice: 'E registration was successfully rejected.' }
      format.json { head :no_content }
    end
  end

  # DELETE /e_registrations/1 or /e_registrations/1.json
  def destroy
    @e_registration.destroy

    respond_to do |format|
      format.html { redirect_to e_registrations_url, notice: "E registration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_e_registration
      @e_registration = ERegistration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def e_registration_params
      # params.fetch(:e_registration, {})
      params.require(:e_registration).permit(:title, :detail, :slot, :subject_id, :timestart, :timeend, :room_id, :image)
    end
end
