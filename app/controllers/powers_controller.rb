class PowersController < ApplicationController
  before_action :set_power, only: [:show, :edit, :update, :destroy]

  # GET /powers
  # GET /powers.json
  def index
    # @powers = Power.all
    # @powers = Power.all.page(params[:page]).per(3)
    @powers = current_user.powers.page(params[:page]).per(3)
  end

  # GET /powers/1
  # GET /powers/1.json
  def show
  end

  # GET /powers/new
  def new
    @power = Power.new
  end

  # GET /powers/1/edit
  def edit
  end

  # POST /powers
  # POST /powers.json
  def create
    @hero = current_user.heros.find(power_params[:hero_id])
    @power = @hero.powers.new(power_params)
    @powers = @hero.powers.order("name").page(params[:page]).per(3)

    respond_to do |format|
      @saved = @power.save
      if @saved
        format.html { redirect_to @power, notice: 'Power was successfully created.' }
        format.json { render :show, status: :created, location: @power }
        format.js { @power = @hero.powers.build }
      else
        format.html { render :new }
        format.json { render json: @power.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /powers/1
  # PATCH/PUT /powers/1.json
  def update
    respond_to do |format|
      @saved = @power.update(power_params)
      if @saved
        format.html { redirect_to @power, notice: 'Power was successfully updated.' }
        format.json { render :show, status: :ok, location: @power }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @power.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /powers/1
  # DELETE /powers/1.json
  def destroy
    @power.destroy
    respond_to do |format|
      format.html { redirect_to powers_url, notice: 'Power was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power
      @power = Power.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def power_params
      params.require(:power).permit(:name, :value, :picture, :user_id, :hero_id)
    end
end
