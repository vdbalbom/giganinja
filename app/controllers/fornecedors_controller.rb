class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedors = Fornecedor.all
  end

  # GET /fornecedors/1
  # GET /fornecedors/1.json
  def show
    @produtos = @fornecedor.produtos
    @telefones = @fornecedor.telefones
    @emails = @fornecedor.emails
  end

  # GET /fornecedors/new
  def new
    @fornecedor = Fornecedor.new
  end

  # GET /fornecedors/1/edit
  def edit
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)
    # TODO: VALIDATE fornecedor must have one or more telefones
    respond_to do |format|
      # TODO: verify telefones and emails, to solve the PROBLEM 1
      if @fornecedor.save
        # PROBLEM 1: this is not de best solution because add_telefones and add_emails could return false
        #            and in this case the forncedor should not be created
        add_telefones
        add_emails
        format.html { redirect_to @fornecedor, notice: 'Fornecedor was successfully created.' }
        format.json { render :show, status: :created, location: @fornecedor }
      else
        format.html { render :new, error: 'Erro.' }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedors/1
  # PATCH/PUT /fornecedors/1.json
  def update
    # TODO: VALIDATE fornecedor must have one or more telefones
    respond_to do |format|
      # TODO: verify telefones and emails, to solve the PROBLEM 2
      if @fornecedor.update(fornecedor_params)
        # PROBLEM 2: this is not de best solution because add_telefones and add_emails could return false
        #            and in this case the forncedor should not be updated
        @fornecedor.telefones.each {|tel| tel.destroy}
        @fornecedor.emails.each {|mail| mail.destroy}
        add_telefones
        add_emails
        format.html { redirect_to @fornecedor, notice: 'Fornecedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    @fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to fornecedors_url, notice: 'Fornecedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome, :descricao, :cidade, :endereco, :bairro, :numero)
    end

    def add_telefones
      params[:ddds].delete("")
      params[:telefones].delete("")
      params[:t_referencias].delete("")
      params[:telefones].length.times do |i|
        telefone = Telefone.new(ddd: params[:ddds][i],
                                numero: params[:telefones][i],
                                referencia: params[:t_referencias][i],
                                fornecedor_id: @fornecedor.id)
        return false unless telefone.save
      end
      return true
    end

    def add_emails
      params[:emails].delete("")
      params[:e_referencias].delete("")
      params[:emails].length.times do |i|
        email = Email.new(endereco_email: params[:emails][i],
                                referencia: params[:e_referencias][i],
                                fornecedor_id: @fornecedor.id)
        return false unless email.save
      end
      return true
    end
end
