require 'securerandom'
class PayQrcodeServicesController < ApplicationController

  before_action :set_pay_qrcode_service, only: [:show, :edit, :update, :destroy]

  # GET /pay_qrcode_services
  # GET /pay_qrcode_services.json
  def index
    @pay_qrcode_services = PayQrcodeService.all
    
    params_pay = {
      body: '测试商品',
      out_trade_no: 'test007',
      total_fee: 1,
      spbill_create_ip: '127.0.0.1',
      notify_url: 'http://making.dev/notify',
      trade_type: 'NATIVE', # could be "JSAPI", "NATIVE" or "APP",
      # openid: 'OPENID' # required when trade_type is `JSAPI`
    }
    r = WxPay::Service.invoke_unifiedorder params_pay
    url = "#{r["code_url"]}"
    # url = "http://mp.weixin.qq.com/wiki/2/5baf56ce4947d35003b86a9805634b1e.html"
    @qr = RQRCode::QRCode.new(url, :size => 6, :level => 'q'.to_sym)

  end

  # GET /pay_qrcode_services/1
  # GET /pay_qrcode_services/1.json
  def show
  end

  # GET /pay_qrcode_services/new
  def new
    @pay_qrcode_service = PayQrcodeService.new
  end

  # GET /pay_qrcode_services/1/edit
  def edit
  end

  # POST /pay_qrcode_services
  # POST /pay_qrcode_services.json
  def create
    @pay_qrcode_service = PayQrcodeService.new(pay_qrcode_service_params)

    respond_to do |format|
      if @pay_qrcode_service.save
        format.html { redirect_to @pay_qrcode_service, notice: 'Pay qrcode service was successfully created.' }
        format.json { render :show, status: :created, location: @pay_qrcode_service }
      else
        format.html { render :new }
        format.json { render json: @pay_qrcode_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_qrcode_services/1
  # PATCH/PUT /pay_qrcode_services/1.json
  def update
    respond_to do |format|
      if @pay_qrcode_service.update(pay_qrcode_service_params)
        format.html { redirect_to @pay_qrcode_service, notice: 'Pay qrcode service was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay_qrcode_service }
      else
        format.html { render :edit }
        format.json { render json: @pay_qrcode_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_qrcode_services/1
  # DELETE /pay_qrcode_services/1.json
  def destroy
    @pay_qrcode_service.destroy
    respond_to do |format|
      format.html { redirect_to pay_qrcode_services_url, notice: 'Pay qrcode service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_qrcode_service
      @pay_qrcode_service = PayQrcodeService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_qrcode_service_params
      params.require(:pay_qrcode_service).permit(:website)
    end
end
