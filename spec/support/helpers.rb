module Helpers

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Logs in a test user.
  def log_in_as(user, options = {})
    password    = options[:password]    || 'foobar'
    remember_me = options[:remember_me] || '0'
    just_log_in = options[:just_log_in] || false
    if !just_log_in
      post '/login', params: { session: { email: user.email,
                                        password: password,
                                        remember_me: remember_me } }
    else
      session[:user_id] = user.id
    end

  end

end