class WhatsappsController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'openssl'

  before_action :set_whatsapp, only: %i[ show edit update destroy ]

  # GET /whatsapps or /whatsapps.json
  def index
    @whatsapps = Whatsapp.all
  end

  # GET /whatsapps/1 or /whatsapps/1.json
  def show
  end

  # GET /whatsapps/new
  def new
    @whatsapp = Whatsapp.new
  end

  # GET /whatsapps/1/edit
  def edit
  end

  # POST /whatsapps or /whatsapps.json
  def create
    @whatsapp = Whatsapp.new(whatsapp_params)

    respond_to do |format|
      if @whatsapp.save
        url = URI("https://api.ultramsg.com/instance17784/messages/chat")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        message = "hello"
        request = Net::HTTP::Post.new(url)
        request["content-type"] = 'application/x-www-form-urlencoded'
        request.body = "token=l6zmd2afto4dz6u9&to=+91#{whatsapp_params[:number]}&body=#{message}&priority=1"

        response = http.request(request)
        puts response.read_body
        format.html { redirect_to whatsapp_url(@whatsapp), notice: "Whatsapp was successfully created." }
        format.json { render :show, status: :created, location: @whatsapp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @whatsapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whatsapps/1 or /whatsapps/1.json
  def update
    respond_to do |format|
      if @whatsapp.update(whatsapp_params)
        format.html { redirect_to whatsapp_url(@whatsapp), notice: "Whatsapp was successfully updated." }
        format.json { render :show, status: :ok, location: @whatsapp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @whatsapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whatsapps/1 or /whatsapps/1.json
  def destroy
    @whatsapp.destroy

    respond_to do |format|
      format.html { redirect_to whatsapps_url, notice: "Whatsapp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whatsapp
      @whatsapp = Whatsapp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def whatsapp_params
      params.require(:whatsapp).permit(:name, :email, :number)
    end
  end
