module StationMaster
  module Ask
    protected
      def ask!(request_url)
        url = URI.parse(URI.escape(request_url))
        http = Net::HTTP.new(url.host, url.port)
        http.read_timeout = 2

        http.get(url).body
      end
  end
end