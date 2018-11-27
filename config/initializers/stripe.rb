if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_dc112STjhjQAUB8vzIlAYFOR',
    secret_key: 'sk_test_jRwdlA3lCuAHra0R7uviywX0'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]