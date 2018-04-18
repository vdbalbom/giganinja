class TransportadorasController < ApplicationController
  before_action :set_transportadora, only: [:show, :edit, :update, :destroy]

  # GET /transportadoras
  # GET /transportadoras.json
  def index
    @transportadoras = Transportadora.all
  end

  # GET /transportadoras/1
  # GET /transportadoras/1.json
  def show
  end

  # GET /transportadoras/new
  def new
    @transportadora = Transportadora.new
  end

  # GET /transportadoras/1/edit
  def edit
  end

  # POST /transportadoras
  # POST /transportadoras.json
  def create
    @transportadora = Transportadora.new(transportadora_params)

    respond_to do |format|
      if @transportadora.save
        format.html { redirect_to @transportadora, notice: 'Transportadora was successfully created.' }
        format.json { render :show, status: :created, location: @transportadora }
      else
        format.html { render :new }
        format.json { render json: @transportadora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transportadoras/1
  # PATCH/PUT /transportadoras/1.json
  def update
    respond_to do |format|
      if @transportadora.update(transportadora_params)
        format.html { redirect_to @transportadora, notice: 'Transportadora was successfully updated.' }
        format.json { render :show, status: :ok, location: @transportadora }
      else
        format.html { render :edit }
        format.json { render json: @transportadora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transportadoras/1
  # DELETE /transportadoras/1.json
  def destroy
    @transportadora.destroy
    respond_to do |format|
      format.html { redirect_to transportadoras_url, notice: 'Transportadora was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transportadora
      @transportadora = Transportadora.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transportadora_params
      params.require(:transportadora).permit(:nome)
    end
end
