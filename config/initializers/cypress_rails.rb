require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation
# puts "***************************************************************************************************"
# puts Rails.env.test?
return unless Rails.env.test?

CypressRails.hooks.before_server_start do
  # Called once, before either the transaction or the server is started
  # DatabaseCleaner.clean

end



CypressRails.hooks.after_transaction_start do
  # Called after the transaction is started (at launch and after each reset)
end

CypressRails.hooks.after_state_reset do
  # Triggered after `/cypress_rails_reset_state` is called
end

CypressRails.hooks.before_server_stop do
  # DatabaseCleaner.clean

  # Called once, at_exit
end
