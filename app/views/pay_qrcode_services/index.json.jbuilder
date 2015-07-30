json.array!(@pay_qrcode_services) do |pay_qrcode_service|
  json.extract! pay_qrcode_service, :id, :website
  json.url pay_qrcode_service_url(pay_qrcode_service, format: :json)
end
