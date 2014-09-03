CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'your_access_key',
    :google_storage_secret_access_key => 'your_secret_key'
  }
  config.fog_directory = 'your_bucket'
end
