module Paperclip
  module Upyun
    class Response

      def self.parse(res)
        return true if res.is_a?(TrueClass)
        raise TypeError, "Upyun Response type: #{res.class}" unless res.is_a?(Hash)
        raise Paperclip::Upyun::Exceptions::NotFoundError, "#{res.to_s}" if not_found_res?(res)
        self.error(res) if res.has_key?(:error) || res.has_key?("error")
        true
      end

      def self.not_found_res?(res)
        res.is_a?(Hash) && res[:error] && res[:error][:code] == 404 && !!(res[:error][:message] =~ /file or directory not found/)
      end

      def self.error(res)
        raise Paperclip::Upyun::Exceptions::ResponseError, "#{res.to_s}"
      end

    end
  end
end
