
$dwolla = DwollaV2::Client.new(key: ENV["DWOLLA_APP_KEY"], secret: ENV["DWOLLA_APP_SECRET"]) do |config|
  config.environment = :sandbox
end

# create an application token
$app_token = $dwolla.auths.client
# all dwolla users in the application
$users = $app_token.get "customers"
# witness org funding account location
root = $app_token.get "/"
bucket_location = root._links.account.href
$bucket_url = $app_token.get "#{bucket_location}/funding-sources"
# witness org id
main = $app_token.get bucket_location
$witness_dwolla_id = main.id
