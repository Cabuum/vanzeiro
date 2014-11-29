class AuthKeysLoader
  # Required to multiple login.
  social_keys = File.join(Rails.root, 'config', 'social_keys.yml')
  loaded_keys = HashWithIndifferentAccess.new(YAML::load(IO.read(social_keys)))[Rails.env]
  loaded_keys.each do |k, v|
    ENV[k.upcase] ||= v
  end
end