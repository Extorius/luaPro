# luaPro
luaPro, short for lua Protection is a set of tools designed for penetration testing and prevention. Easily create strong whitelisting or code protection services, or use our premade whitelisting service "luaPro whitelisting."

## HTTP Spy
Our HTTP Spy provides a powerful HTTP spy with multiple anti-detection options, and different types of hooking. Easily create a powerful Anti HTTP Spy with the perfect tool to test it against.
### Usage
```lua
_G.Settings = {} -- Preparing the settings table.
_G.Settings.UseHookfunction = true -- Will detect any request functions supported by the executor, and hook them.
_G.Settings.UseHookMetamethod = false -- Will detect either the syn or http library, and hook it's __index metamethod to return a hooked request function.
_G.Settings.RemoveSecurity = true -- Will prevent and remove detections and anti hook methods used by Anti HTTP Spies.
_G.Settings.BlockUrls = true -- Will block requests to a premade list of malicious URLs.
_G.Settings.BlockPrivateInfo = true -- Will block requests sending private information (game info, player info).

--[[
Notice:
Don't use both UseHookfunction and UseHookMetamethod, it will cause duplicate frames in the GUI.
]]--

loadstring(game:HttpGet("https://raw.githubusercontent.com/Extorius/luaPro/main/HTTP%20Spy-obfuscated.lua"))() -- Loads the HTTP Spy
```
