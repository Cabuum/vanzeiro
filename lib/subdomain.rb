# frozen_string_literal: true
class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end
