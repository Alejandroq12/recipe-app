ActionMailer::Base.smtp_settings = {
  address: ENV["MAILERTOGO_SMTP_HOST"],
  port: ENV["MAILERTOGO_SMTP_PORT"],
  user_name: ENV["MAILERTOGO_SMTP_USER"],
  password: ENV["MAILERTOGO_SMTP_PASSWORD"],
  domain: ENV["MAILERTOGO_DOMAIN"],
  authentication: :plain,
  enable_starttls_auto: true
}
