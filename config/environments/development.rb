Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.action_mailer.default_url_options = {:host => 'localhost:80'}
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => "mail.adamant.net",
    :port    => 25,
    :domain  => 'travelonline.com.ua',
    :enable_starttls_auto => true
  }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
end
