secrets = YAML.load_file(Rails.root.join('config/secrets.yml'))
if secrets[Rails.env]['secret_key_base'] == 'SOMETHING_RANDOM_HERE'
  raise StandardError.new('You forgot to set the secret token in config/secrets.yml')
end
