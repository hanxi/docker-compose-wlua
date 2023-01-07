local wlua = require "wlua"
local redis = require "skynet.db.redis"

local g_db
local function getdb()
    if g_db then return g_db end
    local conf = { host = "redis", port = 6379, db = 0, }
    g_db = redis.connect(conf)
    return g_db
end

local app = wlua:default()
app:get("/", function (c)
    local db = getdb()
    local count = db:incr("hits")
    c:send(string.format("Hello World! I have been seen %d times.\n", count))
end)

app:run()
