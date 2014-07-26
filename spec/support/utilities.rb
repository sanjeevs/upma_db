def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  cookies[:remember_token] = user.remember_token
end


def full_title(title)
  base_title = "Upanishad Knowledge Map"
  if title.empty?
    base_title
  else
    "#{title}"
  end
end
