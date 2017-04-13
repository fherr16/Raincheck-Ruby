class LineItemsController < ApplicationController
  include CurrentRaincheck
  before_action :set_raincheck, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end
  
  def create 
    if current_user
      restaurant = Restaurant.find( params[:restaurant_id] )
      user_id = session[:user_id]
      user = User.find(user_id)
      hype = cookies[:hype]
      raincheck = Raincheck.find_by(user_id: user_id, user_type: 1)
      @raincheck = Raincheck.find(raincheck)
      @line_item = @raincheck.check(restaurant.id, raincheck.id, hype) 
      if @line_item != 1
        respond_to do |format|
          if @line_item.save
            format.html { redirect_to @line_item.raincheck} 
            format.json { render :show, status: :created, location: @line_item }
          else
            format.html { render :new }
            format.json { render json: @line_item.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:danger] = "You already have the Restaurant"
        redirect_to rainchecks_path
      end
    else
      restaurant = Restaurant.find( params[:restaurant_id] )
      user_id = session[:muser_id]
      user = Muser.find(user_id)
      hype = cookies[:hype]
      raincheck = Raincheck.find_by(user_id: user_id, user_type: 2)
      @raincheck = Raincheck.find (raincheck)
      @line_item = @raincheck.check(restaurant.id, raincheck.id, hype) 
      if @line_item != 1
        respond_to do |format|
          if @line_item.save
            format.html { redirect_to @line_item.raincheck, notice: 'Line item was successfully created.'} 
            format.json { render :show, status: :created, location: @line_item }
          else
            format.html { render :new }
            format.json { render json: @line_item.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:danger] = "You already have the Restaurant"
        redirect_to rainchecks_path
      end
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json


  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:restaurant_id, :raincheck_id, :hype_level)
    end
end
