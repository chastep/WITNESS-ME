
$dwolla = DwollaV2::Client.new(key: ENV["DWOLLA_APP_KEY"], secret: ENV["DWOLLA_APP_SECRET"]) do |config|
  config.environment = :sandbox
end

# create an application token
app_token = $dwolla.auths.client

users = app_token.get "customers", limit: 10
