local http = require "gamesense/http"

local btclogo = renderer.load_svg('<svg xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://www.w3.org/2000/svg" height="64" width="64" version="1.1" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"><g transform="translate(0.00630876,-0.00301984)"><path fill="#f7931a" d="m63.033,39.744c-4.274,17.143-21.637,27.576-38.782,23.301-17.138-4.274-27.571-21.638-23.295-38.78,4.272-17.145,21.635-27.579,38.775-23.305,17.144,4.274,27.576,21.64,23.302,38.784z"/><path fill="#FFF" d="m46.103,27.444c0.637-4.258-2.605-6.547-7.038-8.074l1.438-5.768-3.511-0.875-1.4,5.616c-0.923-0.23-1.871-0.447-2.813-0.662l1.41-5.653-3.509-0.875-1.439,5.766c-0.764-0.174-1.514-0.346-2.242-0.527l0.004-0.018-4.842-1.209-0.934,3.75s2.605,0.597,2.55,0.634c1.422,0.355,1.679,1.296,1.636,2.042l-1.638,6.571c0.098,0.025,0.225,0.061,0.365,0.117-0.117-0.029-0.242-0.061-0.371-0.092l-2.296,9.205c-0.174,0.432-0.615,1.08-1.609,0.834,0.035,0.051-2.552-0.637-2.552-0.637l-1.743,4.019,4.569,1.139c0.85,0.213,1.683,0.436,2.503,0.646l-1.453,5.834,3.507,0.875,1.439-5.772c0.958,0.26,1.888,0.5,2.798,0.726l-1.434,5.745,3.511,0.875,1.453-5.823c5.987,1.133,10.489,0.676,12.384-4.739,1.527-4.36-0.076-6.875-3.226-8.515,2.294-0.529,4.022-2.038,4.483-5.155zm-8.022,11.249c-1.085,4.36-8.426,2.003-10.806,1.412l1.928-7.729c2.38,0.594,10.012,1.77,8.878,6.317zm1.086-11.312c-0.99,3.966-7.1,1.951-9.082,1.457l1.748-7.01c1.982,0.494,8.365,1.416,7.334,5.553z"/></g></svg>', 100, 100)
local ethlogo = renderer.load_svg('<svg width="256px" height="417px" viewBox="0 0 256 417" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMidYMid"><g><polygon fill="#343434" points="127.9611 0 125.1661 9.5 125.1661 285.168 127.9611 287.958 255.9231 212.32"/><polygon fill="#8C8C8C" points="127.962 0 0 212.32 127.962 287.959 127.962 154.158"/><polygon fill="#3C3C3B" points="127.9611 312.1866 126.3861 314.1066 126.3861 412.3056 127.9611 416.9066 255.9991 236.5866"/><polygon fill="#8C8C8C" points="127.962 416.9052 127.962 312.1852 0 236.5852"/><polygon fill="#141414" points="127.9611 287.9577 255.9211 212.3207 127.9611 154.1587"/><polygon fill="#393939" points="0.0009 212.3208 127.9609 287.9578 127.9609 154.1588"/></g></svg>', 64, 104.25)
local ltclogo = renderer.load_svg('<svg xmlns="http://www.w3.org/2000/svg" width="2500" height="2500" viewBox="0.847 0.876 329.254 329.256"><title>Litecoin</title><path d="M330.102 165.503c0 90.922-73.705 164.629-164.626 164.629C74.554 330.132.848 256.425.848 165.503.848 74.582 74.554.876 165.476.876c90.92 0 164.626 73.706 164.626 164.627" fill="#bebebe"/><path d="M295.15 165.505c0 71.613-58.057 129.675-129.674 129.675-71.616 0-129.677-58.062-129.677-129.675 0-71.619 58.061-129.677 129.677-129.677 71.618 0 129.674 58.057 129.674 129.677" fill="#bebebe"/><path d="M155.854 209.482l10.693-40.264 25.316-9.249 6.297-23.663-.215-.587-24.92 9.104 17.955-67.608h-50.921l-23.481 88.23-19.605 7.162-6.478 24.395 19.59-7.156-13.839 51.998h135.521l8.688-32.362h-84.601" fill="#fff"/></svg>', 100, 100)
local xrplogo = renderer.load_svg('<svg width="424" height="368" viewBox="0 0 424 368" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M180.549 0H211.212L147.418 66.1679C124.326 90.1199 86.8857 90.1199 63.7933 66.1679L1.04176e-08 0H30.6624L79.1246 50.2661C93.7497 65.4356 117.461 65.4356 132.087 50.2661L180.549 0Z" transform="translate(0.792969) scale(2)" fill="white"/><path d="M30.6625 84.5407H0L64.1874 17.9639C87.2798 -5.98797 124.72 -5.98797 147.813 17.9639L212 84.5407H181.337L132.481 33.8655C117.855 18.6958 94.1438 18.6958 79.5187 33.8655L30.6625 84.5407Z" transform="translate(0 198.919) scale(2)" fill="white"/></svg>', 100, 100)
local dogelogo = renderer.load_svg('<svg width="226.777" height="226.777" xmlns="http://www.w3.org/2000/svg"><g><title>background</title><rect fill="none" id="canvas_background" height="402" width="582" y="-1" x="-1"/></g><g><title>Layer 1</title><path fill="#87641d" id="svg_1" d="m116.338,74.87c-6.069,0 -16.236,0 -16.236,0l0,32l25.538,0l0,13.399l-25.538,0l0,32c0,0 12.65,0 17.023,0c4.375,0 35.918,0.494 35.87,-37.232c-0.048,-37.724 -30.589,-40.167 -36.657,-40.167z"/><path fill="#87641d" id="svg_2" d="m113.609,0c-62.745,0 -113.609,50.864 -113.609,113.608c0,62.745 50.864,113.609 113.609,113.609c62.743,0 113.607,-50.864 113.607,-113.609c0,-62.744 -50.864,-113.608 -113.607,-113.608zm4.464,174.968l-41.145,0l0,-54.698l-14.503,0l0,-13.399l14.502,0l0,-54.701c0,0 26.958,0 35.312,0c8.354,0 63.684,-1.735 63.684,62.425c0,65.221 -57.85,60.373 -57.85,60.373z"/></g></svg>', 100, 100)

local x, y, w, h = database.read("cryptoposx") or 200, database.read("cryptoposy") or 200, 175, 150

local cryptotype = ui.new_combobox("LUA", "B", "Cryptocurrency", "BTC", "ETH", "LTC", "XRP", "DOGE")
local currency = ui.new_combobox("LUA", "B", "Currency to convert to", "USD", "EUR", "GBP")
local update_time = ui.new_slider("LUA", "B", "Price update time", 1, 15, 3, true, "s")

local cryptoparsed

local function refresh()
    http.get("https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,dogecoin,litecoin,ripple&vs_currencies=gbp,usd,eur", function(success, response)
        if not success or response.status ~= 200 then
          return
        end

        cryptoparsed = json.parse(response.body)
    end)
end

local last_update = client.unix_time()
local function on_paint_ui()
    if client.unix_time() > last_update + ui.get(update_time) then
        refresh()
        last_update = client.unix_time()
    end

    if cryptoparsed == nil then
        return
    end

    renderer.rectangle(x-6, y-6, w+12, h+12, 12, 12, 12, 255)
    renderer.rectangle(x-5, y-5, w+10, h+10, 60, 60, 60, 255)
    renderer.rectangle(x-4, y-4, w+8, h+8, 40, 40, 40, 255)
    renderer.rectangle(x-1, y-1, w+2, h+2, 60, 60, 60, 255)
    renderer.rectangle(x, y, w, h, 23, 23, 23, 255)
    renderer.gradient(x+1, y+1, w/2-1, 2, 55, 177, 218, 255, 201, 84, 205, 255, true)
    renderer.gradient(x+w/2-1, y+1, w/2, 2, 201, 84, 205, 255, 204, 207, 53, 255, true)
    if ui.get(currency) == "USD" and ui.get(cryptotype) == "BTC" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "$" .. cryptoparsed.bitcoin.usd)
    elseif ui.get(currency) == "EUR" and ui.get(cryptotype) == "BTC" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "€" .. cryptoparsed.bitcoin.eur)
    elseif ui.get(currency) == "GBP" and ui.get(cryptotype) == "BTC" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "£" .. cryptoparsed.bitcoin.gbp)
    end
    if ui.get(currency) == "USD" and ui.get(cryptotype) == "ETH" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "$" .. cryptoparsed.ethereum.usd)
    elseif ui.get(currency) == "EUR" and ui.get(cryptotype) == "ETH" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "€" .. cryptoparsed.ethereum.eur)
    elseif ui.get(currency) == "GBP" and ui.get(cryptotype) == "ETH" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "£" .. cryptoparsed.ethereum.gbp)
    end
    if ui.get(currency) == "USD" and ui.get(cryptotype) == "XRP" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "$" .. cryptoparsed.ripple.usd)
    elseif ui.get(currency) == "EUR" and ui.get(cryptotype) == "XRP" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "€" .. cryptoparsed.ripple.eur)
    elseif ui.get(currency) == "GBP" and ui.get(cryptotype) == "XRP" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "£" .. cryptoparsed.ripple.gbp)
    end
    if ui.get(currency) == "USD" and ui.get(cryptotype) == "DOGE" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "$" .. cryptoparsed.dogecoin.usd)
    elseif ui.get(currency) == "EUR" and ui.get(cryptotype) == "DOGE" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "€" .. cryptoparsed.dogecoin.eur)
    elseif ui.get(currency) == "GBP" and ui.get(cryptotype) == "DOGE" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "£" .. cryptoparsed.dogecoin.gbp)
    end
    if ui.get(currency) == "USD" and ui.get(cryptotype) == "LTC" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "$" .. cryptoparsed.litecoin.usd)
    elseif ui.get(currency) == "EUR" and ui.get(cryptotype) == "LTC" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "€" .. cryptoparsed.litecoin.eur)
    elseif ui.get(currency) == "GBP" and ui.get(cryptotype) == "LTC" then
        renderer.text(x+w/2, y+h-20, 255, 255, 255, 255, "cb", 0, "£" .. cryptoparsed.litecoin.gbp)
    end
    if ui.get(cryptotype) == "BTC" then
        renderer.texture(btclogo, x+w/2-50, y+h/2-60, 100, 100, 255, 255, 255, 255)
    elseif ui.get(cryptotype) == "ETH" then
        renderer.texture(ethlogo, x+w/2-32, y+h/2-60, 64, 104.25, 255, 255, 255, 255)
    elseif ui.get(cryptotype) == "LTC" then
        renderer.texture(ltclogo, x+w/2-50, y+h/2-60, 100, 100, 255, 255, 255, 255)
    elseif ui.get(cryptotype) == "XRP" then
        renderer.texture(xrplogo, x+w/2-50, y+h/2-60, 100, 100, 255, 255, 255, 255)
    elseif ui.get(cryptotype) == "DOGE" then
        renderer.texture(dogelogo, x+w/2-50, y+h/2-60, 100, 100, 255, 255, 255, 255)
    end
    local mouseposx, mouseposy = ui.mouse_position()
    if client.key_state(0x01) and mouseposy <= y+h and mouseposy >= y and mouseposx <= x+w and mouseposx >= x then
        x = mouseposx - w/2
        y = mouseposy - h/2
        database.write("cryptoposx", x)
        database.write("cryptoposy", y)
    end
end
client.set_event_callback("paint_ui", on_paint_ui)


client.set_event_callback("round_start", refresh)
refresh()

local function on_shutdown()
    database.write("cryptoposx", x)
    database.write("cryptoposy", y)
end
client.set_event_callback("shutdown", on_shutdown)
