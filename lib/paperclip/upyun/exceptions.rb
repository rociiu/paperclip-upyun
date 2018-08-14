module Paperclip
  module Upyun
    module Exceptions
      class Error < StandardError; end
      class UploadFailed < Error; end
      class ResponseError < Error; end
      class NotFoundError < Error; end
      class OptionsError < Error; end
    end
  end
end
