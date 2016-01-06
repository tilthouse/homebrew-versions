class SeleniumServerStandalone243 < Formula
  desc "Automated Browser Control"
  homepage "http://seleniumhq.org/"
  url "https://selenium-release.storage.googleapis.com/2.43/selenium-server-standalone-2.43.1.jar"
  sha256 "d3a5f08f7fe1f9e448a8cfbea1063f4aba732ce1061636bffa4e387b9904c7e2"

  conflicts_with "selenium-server-standalone", :because => "Differing version of core formula"
  conflicts_with "selenium-server-standalone245", :because => "Differing version of core formula"

  def install
    libexec.install "selenium-server-standalone-2.43.1.jar"
    bin.write_jar_script libexec/"selenium-server-standalone-2.43.1.jar", "selenium-server"
  end

  plist_options :manual => "selenium-server -p 4444"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <false/>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/bin/java</string>
        <string>-jar</string>
        <string>#{libexec}/selenium-server-standalone-2.45.0.jar</string>
        <string>-port</string>
        <string>4444</string>
      </array>
      <key>ServiceDescription</key>
      <string>Selenium Server</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/selenium-error.log</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/selenium-output.log</string>
    </dict>
    </plist>
  EOS
  end
end