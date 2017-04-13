class RainchecksController < ApplicationController
  before_action :set_raincheck, only: [:show, :edit, :update, :destroy]

  # GET /rainchecks
  # GET /rainchecks.json
  def index
    @rainchecks = Raincheck.all
  end

  # GET /rainchecks/1
  # GET /rainchecks/1.json
  def show
    if current_user
      @raincheck = Raincheck.find_by(user_id: current_user.id, user_type: 1)
    else
      @raincheck = Raincheck.find_by(user_id: current_muser.id, user_type: 2)
    end
  end

  # GET /rainchecks/new
  def new
    @raincheck = Raincheck.new
  end

  # GET /rainchecks/1/edit
  def edit
  end

  # POST /rainchecks
  # POST /rainchecks.json
  def create
    if current_user
      @raincheck = Raincheck.new(raincheck_params)
      @raincheck.user_id = session[:user_id]
      @raincheck.user_type = 1
      respond_to do |format|
        if @raincheck.save
          format.html { redirect_to @raincheck}
          format.json { render :show, status: :created, location: @raincheck }
        else
          format.html { render :new }
          format.json { render json: @raincheck.errors, status: :unprocessable_entity }
        end
      end
    else
      @raincheck = Raincheck.new(raincheck_params)
      @raincheck.user_id = session[:muser_id]
      @raincheck.user_type = 2
      respond_to do |format|
        if @raincheck.save
          format.html { redirect_to @raincheck }
          format.json { render :show, status: :created, location: @raincheck }
        else
          format.html { render :new }
          format.json { render json: @raincheck.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /rainchecks/1
  # PATCH/PUT /rainchecks/1.json
  def update
    respond_to do |format|
      if @raincheck.update(raincheck_params)
        format.html { redirect_to @raincheck, notice: 'Raincheck was successfully updated.' }
        format.json { render :show, status: :ok, location: @raincheck }
      else
        format.html { render :edit }
        format.json { render json: @raincheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rainchecks/1
  # DELETE /rainchecks/1.json
  def destroy
    @raincheck.destroy
    respond_to do |format|
      format.html { redirect_to rainchecks_url, notice: 'Raincheck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raincheck
      @raincheck = Raincheck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raincheck_params
      params.fetch(:raincheck, {})
    end
end
