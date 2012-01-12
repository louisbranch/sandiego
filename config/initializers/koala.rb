Koala.http_service.http_options = {
  :ssl => { :ca_path => "/etc/ssl/certs" }
}

module Facebook
  CONFIG = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
  APP_ID = CONFIG['app_id']
  SECRET = CONFIG['secret_key']
  CANVAS_URL = CONFIG['canvas_url']
  SCOPE = CONFIG['scope'].to_s.delete(' ')
end

Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    case args.size
      when 0, 1
        raise "application id and/or secret are not specified in the config" unless Facebook::APP_ID && Facebook::SECRET
        initialize_without_default_settings(Facebook::APP_ID.to_s, Facebook::SECRET.to_s, args.first)
      when 2, 3
        initialize_without_default_settings(*args)
    end
  end

  def canvas_url
    Facebook::CANVAS_URL.to_s
  end

  def authorize_url
    "https://www.facebook.com/dialog/oauth?client_id=#{Facebook::APP_ID}&redirect_uri=#{Facebook::CANVAS_URL}&scope=#{Facebook::SCOPE}"
  end

  alias_method_chain :initialize, :default_settings
end
