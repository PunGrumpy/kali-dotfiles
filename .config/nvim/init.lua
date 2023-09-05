--   __  __  ____    _____   __  __  ______
--  /\ \/\ \/\  _`\ /\  __`\/\ \/\ \/\__  _\   /'\_/`\
--  \ \ `\\ \ \ \L\_\ \ \/\ \ \ \ \ \/_/\ \/  /\      \
--   \ \ , ` \ \  _\L\ \ \ \ \ \ \ \ \ \ \ \  \ \ \__\ \
--    \ \ \`\ \ \ \L\ \ \ \_\ \ \ \_/ \ \_\ \__\ \ \_/\ \
--     \ \_\ \_\ \____/\ \_____\ `\___/ /\_____\\ \_\\ \_\
--      \/_/\/_/\/___/  \/_____/`\/__/  \/_____/ \/_/ \/_/

require('kali-pungrumpy.base')
require('kali-pungrumpy.highlights')
require('kali-pungrumpy.maps')
require('kali-pungrumpy.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_linux = has "unix"
local is_win = has "win32"

if is_mac then
  require('kali-pungrumpy.macos')
end
if is_linux then
  require('kali-pungrumpy.linux')
end
if is_win then
  require('kali-pungrumpy.windows')
end
