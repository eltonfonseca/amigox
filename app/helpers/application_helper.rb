module ApplicationHelper
    def gravatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        url = "https://s.gravatar.com/avatar/#{gravatar_id}?s=80"
    end
end
