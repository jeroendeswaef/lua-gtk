local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")

function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

--[[ GtkBuilder:

  A mechanism provided by Gtk that allows build user interfaces
  using a XML definition. That XML definition can be in a file
  or an string of the programming language that you use.

  This can be very helpful, because you don't need create the
  entire UI from code, instead, you can use a XML definition
  of your app UI and in the code side, you write the whatever
  your app will do.

]]
local Builder = Gtk.Builder.new_from_file(script_path() .. "GtkBuilder.ui")

local App     = Gtk.Application({
  application_id = "com.github.jeroendeswaef.GtkBuilder1"
})

function App:on_startup()
  self:add_window(Builder:get_object("Window"))
end

function App:on_activate()
  self.active_window:present()
end

return App:run(arg)