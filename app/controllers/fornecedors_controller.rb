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
    @telefones = []
    @emails = []
  end

  # GET /fornecedors/1/edit
  def edit
    @telefones = @fornecedor.telefones
    @emails = @fornecedor.emails
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)
    @telefones = get_telefones
    @emails = get_emails
    respond_to do |format|
      if validate_telefones && validate_emails && @fornecedor.save # TODO: deal with validates errors messages
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
    @telefones = get_telefones
    @emails = get_emails
    respond_to do |format|
      if validate_telefones && validate_emails && @fornecedor.update(fornecedor_params) # TODO: deal with validates errors messages
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

    def get_telefones
      telefones = []
      if params[:telefone]
        params[:telefone].delete_if {|t| t[:ddd] + t[:numero] + t[:referencia] == ""}
        params[:telefone].each do |t|
          telefones.append(Telefone.new(ddd: t[:ddd], numero: t[:numero],
                                       referencia: t[:referencia]))
        end
      end
      return telefones
    end

    def get_emails
      emails = []
      if params[:email]
        params[:email].delete_if {|e| e[:endereco_email] + e[:referencia] == ""}
        params[:email].each do |e|
          emails.append(Email.new(endereco_email: e[:endereco_email],
                                  referencia: e[:referencia]))
        end
      end
      return emails
    end

    # TODO: move valitations to models
    def validate_telefones
      # must have one or more telefones
      return false if @telefones.empty?
      @telefones.each do |t|
        # each telefone must have ddd and numero
        return false if t.ddd == "" || t.numero == ""
      end
      return true
    end

    # TODO: move valitations to models
    def validate_emails
      # can have zero or more emails
      @emails.each do |e|
        # each email must have endereco_email
        return false if e.endereco_email == ""
      end
      return true
    end

    def add_telefones
      @telefones.each do |t|
        t.fornecedor = @fornecedor
        t.save
      end
    end

    def add_emails
      @emails.each do |e|
        e.fornecedor = @fornecedor
        e.save
      end
    end
end
