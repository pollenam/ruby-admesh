require "mkmf"
require "fileutils"

find_executable("make")
source_dir = File.absolute_path(File.join(File.dirname(__FILE__), "admesh"))

FileUtils.touch(File.join(Dir.pwd, "admesh." + RbConfig::CONFIG['DLEXT']))

Dir.chdir(source_dir) do
  `touch configure.ac aclocal.m4 configure Makefile.am Makefile.in`
  `./configure`
  `make`
end

create_makefile "#{source_dir}/admesh"
