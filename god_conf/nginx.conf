God.watch do |w|
  w.pid_file = "/tmp/nginx.pid"
  w.name = "nginx"
  w.interval = 30.seconds # default
  w.start = "sudo /usr/sbin/nginx -c /etc/nginx/nginx.conf"
  w.stop = "sudo killall nginx"
  w.restart = "sudo killall nginx && sudo /usr/sbin/nginx -c /etc/nginx/nginx.conf"
  w.start_grace = 10.seconds
  w.restart_grace = 10.seconds

  w.behavior(:clean_pid_file)

  w.start_if do |start|
     start.condition(:process_running) do |c|
       c.interval = 5.seconds
       c.running = false
     end
   end

   w.restart_if do |restart|

     restart.condition(:http_response_code) do |c|
       c.host = 'localhost'
       c.port = 80
       c.path = '/'
       c.timeout = 3.seconds
       c.times = [4, 5]
       c.code_is_not = 200
     end

    restart.condition(:memory_usage) do |c|
      c.above = 50.megabytes
      c.times = [3, 5] # 3 out of 5 intervals
    end

    restart.condition(:cpu_usage) do |c|
      c.above = 50.percent
      c.times = 5
    end

   end

    # lifecycle
    w.lifecycle do |on|
      on.condition(:flapping) do |c|
        c.to_state = [:start, :restart]
        c.times = 5
        c.within = 5.minute
        c.transition = :unmonitored
        c.retry_in = 10.minutes
        c.retry_times = 5
				c.retry_within = 2.hours
      end
    end

end


