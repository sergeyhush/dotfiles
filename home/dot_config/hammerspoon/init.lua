hs.window.animationDuration = 0

local function reloadConfig(files)
    for _, file in ipairs(files) do
        if file:sub(-4) == ".lua" then
            hs.reload()
            return
        end
    end
end
hs.pathwatcher.new(hs.configdir, reloadConfig):start()
hs.alert.show("Hammerspoon reloaded")

-- Spoons bootstrap (SpoonInstall + KSheet) — only load if present on disk
local spoonsDir = hs.configdir .. "/Spoons"
local function spoonExists(name)
    if not hs.fs then
        return false
    end
    return hs.fs.attributes(spoonsDir .. "/" .. name .. ".spoon") ~= nil
end

if spoonExists("SpoonInstall") and hs.loadSpoon and hs.loadSpoon("SpoonInstall") and spoon and spoon.SpoonInstall then
    spoon.SpoonInstall.use_syncinstall = true
    spoon.SpoonInstall:andUse("KSheet", {
        hotkeys = { toggle = { { "cmd", "alt", "ctrl" }, "/" } },
    })
elseif spoonExists("KSheet") and hs.loadSpoon and hs.loadSpoon("KSheet") and spoon and spoon.KSheet then
    spoon.KSheet:bindHotkeys({ toggle = { { "cmd", "alt", "ctrl" }, "/" } })
end

local config = {}
config.applications = {
    ["Alfred"] = {
        bundleID = "com.runningwithcrayons.Alfred",
        local_bindings = { "c", "space", "o" },
    },
    ["Ghostty"] = {
        bundleID = "com.mitchellh.ghostty",
        hyper_key = "t",
        tags = { "#coding" },
    },
    ["Zoom"] = {
        bundleID = "us.zoom.xos",
        hyper_key = "z",
        tags = { "#coding" },
    },
    ["Slack"] = {
        bundleID = "com.tinyspeck.slackmacgap",
        hyper_key = "s",
        tags = { "#distraction", "#communication" },
    },
    ["Browser"] = {
        bundleID = "com.google.Chrome",
        hyper_key = "s",
        tags = { "#distraction", "#communication" },
    },
}

local hyper = require("hyper")
hyper.start(config)
