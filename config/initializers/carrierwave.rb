require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    #config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = ENV['AWS_BUCKET_NAME']
    config.fog_public = false #trueにするとURLから誰でも見られる。
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_REGION'], # リージョン
      #path_style: true
    }
end 