CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGRBOULGFMZKEOOUAN',
    :google_storage_secret_access_key => 'bCVxuBVrGziOqyUE6sSHeNi/M8X7xWegv724WpMa'
  }
  config.fog_directory = 'minhhaicc'
end