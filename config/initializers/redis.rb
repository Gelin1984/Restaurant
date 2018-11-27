# config/initlializers/redis.rb

# $redis = Redis::Namespace.new("my_app", :redis => Redis.new)

if Rails.env.production?
	$redis = Redis.new(url: ENV["REDIS_URL"])
	# $redis = Redis.new(url: ENV["redis://h:p306aebbcb10dbb0eb84113d9ec9ad237cf311e2074d91443d71640e5d2aae9af@ec2-34-230-117-175.compute-1.amazonaws.com:18609"])
else
	 $redis = Redis.new(:host => 'localhost', :port => 6379)
end