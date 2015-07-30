class PayQrcodeService < ActiveRecord::Base
  def self.qrcode
    r = WxPay::Service.invoke_unifiedorder params
    url = "http://www.tuicool.com/articles/n2qumu"
    @qr = RQRCode::QRCode.new(url, :size => 6, :level => 'q'.to_sym)




    # config/routes.rb
post "notify" => "orders#notify"

# app/controllers/orders_controller.rb

def notify
  result = Hash.from_xml(request.body.read)["xml"]

  if WxPay::Sign.verify?(result)

    # find your order and process the post-paid logic.

    render :xml => {return_code: "SUCCESS"}.to_xml(root: 'xml', dasherize: false)
  else
    render :xml => {return_code: "SUCCESS", return_msg: "签名失败"}.to_xml(root: 'xml', dasherize: false)
  end
end



params = {
  body: '测试商品',
  out_trade_no: 'test003',
  total_fee: 1,
  spbill_create_ip: '127.0.0.1',
  notify_url: 'http://making.dev/notify',
  trade_type: 'NATIVE', # could be "JSAPI", "NATIVE" or "APP",
  openid: 'OPENID' # required when trade_type is `JSAPI`
}







  end
	
end
