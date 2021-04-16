package = "foxtrot"
version = "dev-0"
description = {
	license = "GPL-3",
	homepage = "https://github.com/leonardus/foxtrot",
	maintainer = "leonardus <leonardus@leonardus.me>",
}
dependencies = {
	"lua >= 5.1",
	"lua-toml >= 2.0",
	"cqueues >= 20200603.51"
}
source = {
	url = "git+https://github.com/leonardus/foxtrot.git"
}
build = {
	type = "builtin",
	modules = {
		["foxtrot"] = "src/main.lua",
		["foxtrot.config"] = "src/config.lua",
		["foxtrot.readfile"] = "src/readfile.lua"
	},
	install = {
		bin = {
			foxtrot = "bin/foxtrot.lua"
		}
	}
}
