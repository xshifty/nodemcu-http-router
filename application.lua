http = require('http')

gpio.mode(1, gpio.OUTPUT)

http.routes["/"] =  { 
    GET = function(request) 
        response = {}
        response.status = 200
        response.content = [[
            <a href="/on">ON</a><br />
            <a href="/off">OFF</a>
        ]]
        
        return response
    end,
}

http.routes["/on"] =  { 
    GET = function(request) 
        response = {}
        response.status = 200
        response.redirect = "/"
        
        gpio.write(1, gpio.HIGH)

        return response
    end,
}

http.routes["/off"] =  { 
    GET = function(request) 
        response = {}
        response.status = 200
        response.redirect = "/"
        
        gpio.write(1, gpio.LOW)

        return response
    end,
}

http.listen(80)
