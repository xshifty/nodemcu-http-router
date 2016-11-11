if pcall(function ()
	dofile("wificonfig.lua")
end) then
	wifi.setmode(wifi.STATION)
	wifi.sta.config(config.ssid, config.password)
	wifi.sta.connect()
	timeout = 0

	tmr.alarm(1, 1000, 1, function ()
		if wifi.sta.getip() == nil then
			print("IP unavailable, waiting... " .. timeout)
		timeout = timeout + 1
		if timeout > 60 then
		    file.remove("wificonfig.lua")
		    node.restart()
		end
		else
		    tmr.stop(1)
		    print("Connected, IP is ".. wifi.sta.getip())
		    
		    dofile("application.lua")
	    end
    end)
else
    print("Wifi config not found!")
end
